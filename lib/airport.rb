require_relative 'plane'
class Airport

  @parked_planes = 0

  def tell_to_land(plane)
    @parked_planes = 1
  end

  def tell_to_takeoff(plane)
    @parked_planes = 0
  end
end