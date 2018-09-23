module ApplicationHelper

  def unread_messages
    unread_messages = []
    @conversations_with_current_user = Conversation.where('sender_id=' + current_user.id.to_s + ' OR ' + 'recipient_id=' + current_user.id.to_s)
    @conversations_with_current_user.each do |conversation|
      conversation.messages.each do |msg|
        unread_messages << msg if msg.read == false && msg.user_id != current_user.id
      end
    end
    unread_messages
  end

  def puts_location(ip)
    geoip = GeoIP.new(Rails.root.join('lib/GeoIP.dat'))
    geoip.country("#{ip}").country_name
  end

  def show_date(date)
    date = date.strftime("%d %m %Y")
    date = date.split(" ")
    case date[1]
    when "01"
      date[1] = "Января"
    when "02"
      date[1] = "Февраля"
    when "03"
      date[1] = "Марта"
    when "04"
      date[1] = "Апреля"
    when "05"
      date[1] = "Мая"
    when "06"
      date[1] = "Июня"
    when "07"
      date[1] = "Июля"
    when "08"
      date[1] = "Августа"
    when "09"
      date[1] = "Сентября"
    when "10"
      date[1] = "Октября"
    when "11"
      date[1] = "Ноября"
    when "12"
      date[1] = "Декабря"
    end
    date.join(" ")
  end

  def sklonenie(number, krokodil, krokodila, krokodilov, with_number = false)
  if (number == nil || !number.is_a?(Numeric))
    number = 0 # если первый параметр пустой или не число, то по умолчанию 0
  end

  prefix = ""
  prefix = "#{number} " if with_number # число с пробеллом, если with_number правда
  ostatok = number % 10 # склонение определяется последней цифрой в числе
  ostatok100 = number % 100
  if (ostatok100 >= 11 && ostatok100 <= 14)  # исключение для цифр от 11 до 14
    return "#{prefix}#{krokodilov}"          # родительный падеж (Кого? Чего?)
  end

  if (ostatok == 1)
    return "#{prefix}#{krokodil}" # для 1 - именительный падеж (Кто? Что?)
  end

  if (ostatok >= 2 && ostatok <= 4) # для 2-4 родительный падеж (Кого? Чего?)
    return "#{prefix}#{krokodila}"
  end

  # 5-9 или 0 - родительный падеж множественное число
  if (ostatok > 4 || ostatok == 0)
    return "#{prefix}#{krokodilov}"
  end
end


end
