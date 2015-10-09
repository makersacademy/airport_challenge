class Airport

  attr_accessor :capacity, :aircraft_count

  def initialize(limit=10)
    @capacity = limit
    @aircraft_count = []
  end

  def land_plane(plane)
    fail "There is a storm, the plane cannot land!" if weather == "stormy"
    fail "Airport at full capacity" if full?
    @aircraft_count << plane
    plane.land
  end

  def take_off(plane)
    fail "There is a storm, the plane cannot land!" if weather == "stormy"
    aircraft_count.pop
    plane.take_off 
  end

  def weather
    rand(100) > 50 ? "sunny" : "stormy"
  end

  private

  def full?
    aircraft_count.size >= capacity
  end

end