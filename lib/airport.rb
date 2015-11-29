require_relative '../lib/plane.rb'

class Airport

  def land(plane, weather)
    @weather = weather
    fail 'cannot land, too stormy' if @weather.condition == true
    @plane = plane
    @plane.status("landed")
  end

  def take_off(plane, weather)
    @weather = weather
    fail 'cannot take off, too stormy' if @weather.condition == true
    @plane = plane
    @plane.status("on air")
  end


end
