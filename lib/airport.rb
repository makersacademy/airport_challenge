class Airport
  attr_accessor :capacity, :planes, :weather

  def initialize capacity = 1
    @capacity = capacity >= 0 ? capacity : 1
    @planes = []
    @weather = :sunny
  end

  def clear_for_landing(plane)
    raise "Plane is not in flight" unless plane.in_flight?
    plane.land
    @planes << plane
  end

  def clear_for_takeoff(plane)
    raise "Plane is already in flight" if plane.in_flight?
    plane.takeoff
    @planes.delete plane
  end

  # def full?
  #   planes.size == @capacity
  # end
end