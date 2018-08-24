module ApplicationHelper

  def put_location(user)
    geoip = GeoIP.new(Rails.root.join('lib/GeoIP.dat'))
    geoip.country(request.remote_ip).country_name
    return request.remote_ip
  end

end
