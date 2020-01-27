require_relative 'plane'
class Airport
  def landing(plane)
    fail "The airport is full" if @plane
    @plane = plane
  end

  def takeoff
    return Plane.new
  end
end
