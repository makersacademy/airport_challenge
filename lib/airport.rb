require_relative 'plane'
require_relative 'weather'

class Airport
  def initialize
    @hanger = []
  end

  def plane_land(plane)
    raise 'Plane is not allowed to land when stormy' if now_stormy?
    @hanger.push(plane)
  end

  def plane_take_off(plane)
    raise 'Plane is not allowed to take off when stormy' if now_stormy?
    @hanger.delete(plane)
    return @hanger
  end
  private

  def now_stormy?
    return true if Weather.new.current_weather == "stormy"
    false
  end

end
