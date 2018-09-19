module ProductsHelper

  def exchange_rate(currency) # Каждый раз по новой читает, тормозит сайт. Исправь потом
    doc = Nokogiri::HTML(open("https://www.ecb.europa.eu/stats/eurofxref/eurofxref-daily.xml"))
    doc.xpath("//cube").each do |str|
      return str["rate"].to_i if str["currency"] == currency
    end
  end

  def show_price(price)
    if session[:currency] == "EUR" || !session[:currency].present?
      return "#{price} EUR"
    else
      return "#{price*exchange_rate(session[:currency])} #{session[:currency]}"
    end
  end

  def show_id(id)
    zeros = 7 - id.to_s.length
    res = []
    zeros.times { res << "0" }
    res << id
    res.join
  end

  def show_expirience(created_at)
    days = (Time.now - created_at) / 60 / 60 / 24
    if days < 1
      "1 день"
    else
      days.to_i.to_s + " #{sklonenie(days.to_i, "день", "дня", "дней")}"
    end
  end
end
