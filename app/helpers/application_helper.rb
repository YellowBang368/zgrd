module ApplicationHelper

  def put_location(user)
    geoip = GeoIP.new(Rails.root.join('lib/GeoIP.dat'))
    if request.remote_ip = "127.0.0.1"
      "87.70.63.132"
    else
      geoip.country(request.remote_ip).country_name
    end
  end

end
