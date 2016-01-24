require "./lib/Plane.rb"

class Airport

  DEFAULT_CAPACITY = 20

  attr_reader :capacity

  def initialize(capacity = DEFAULT_CAPACITY)
    @capacity = capacity
    @planes_in_airport = []
    @full = false
  end

  def full_check
    @full = true if @planes_in_airport.length > @capacity
  end

  def full?
    full_check
    @full
  end

  def new_plane_landed(plane)
    @planes_in_airport.push(plane)
  end

  def new_plane_takeoff(plane)
    @planes_in_airport.delete(plane)
  end

  def list_landed_planes
    list_of_planes = @planes_in_airport.clone
  end

end
