module ProductsHelper

  def show_price(price)
    price.to_s.reverse.gsub(/(.{3})/, '\1 ').reverse
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
