module ApplicationHelper

  def put_location(user)
    geoip = GeoIP.new(Rails.root.join('lib/GeoIP.dat'))


    return ""
  end



end
