module ApplicationHelper

  def puts_location(ip)
    geoip = GeoIP.new(Rails.root.join('lib/GeoIP.dat'))
    geoip.country("#{ip}").country_name
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
