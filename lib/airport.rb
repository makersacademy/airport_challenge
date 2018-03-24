require_relative 'plane'

class Airport
  def initialize
    @hanger = []
  end

  def plane_land(plane)
    @hanger.push(plane)
  end

  def plane_take_off
    @hanger.pop
  end

end
