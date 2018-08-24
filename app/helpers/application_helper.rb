module ApplicationHelper

  def put_location(user)
    geoip = GeoIP.new(Rails.root.join('lib/GeoIP.dat'))
    if request.remote_ip = "127.0.0.1"
      "87.70.63.132"
    else
      geoip.country(request.remote_ip).country_name
    end
    return request.env['REMOTE_ADDR'] + " " + geoip.country(request.remote_ip).country_name + " " + geoip.country(request.env['REMOTE_ADDR']).country_name + " " + geoip.country(request.env['HTTP_X_REAL_IP']).country_name
  end

end
