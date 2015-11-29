require_relative '../lib/plane.rb'

class Airport

  def land(plane, weather)
    @plane = plane
    @plane.status("landed")

  end

  def take_off(plane, weather)
    @plane = plane
    @plane.status("on air")
  end


end
