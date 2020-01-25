require_relative 'plane'
class Airport

  def initialize(capacity=1)
    @capacity = capacity
    @parked_planes = []
  end

  def tell_to_land(plane)
    if @parked_planes.size == @capacity
      raise "Can't land, because airport is full. Capacity is #{@capacity}, and there are #{@parked_planes.size} parked planes."
    else
    @parked_planes << plane
    end
  end

  def tell_to_takeoff(plane)
    @parked_planes.pop
    @parked_planes.count
  end
end