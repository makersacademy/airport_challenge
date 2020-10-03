require_relative 'plane'

class Airport
  def land(plane)
    raise "This airport is full." if @plane
    @plane = plane
  end

  def take_off(plane)
    plane.flying
    @plane
  end
end
