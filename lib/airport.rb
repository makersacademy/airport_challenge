require_relative 'plane'
class Airport

  @parked_planes = 0

  def tell_to_land(plane)
    if @parked_planes == 1
      raise "Can't land. Airport is full."
    else
    @parked_planes = 1
    end
  end

  def tell_to_takeoff(plane)
    @parked_planes = 0
  end
end