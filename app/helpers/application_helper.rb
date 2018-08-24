module ApplicationHelper

  def puts_location(ip)
    geoip = GeoIP.new(Rails.root.join('lib/GeoIP.dat'))
    geoip.country("#{ip}").country_name
  end



end
