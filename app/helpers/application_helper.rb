module ApplicationHelper

  def put_location(user)
    geoip = GeoIP.new(Rails.root.join('lib/GeoIP.dat'))

    return request.remote_ip + " " +  request.env["HTTP_X_REAL_IP"]
  end



end
