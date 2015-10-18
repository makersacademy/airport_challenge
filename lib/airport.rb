require_relative 'plane'

class Airport

DEFAULT_CAPACITY = 20

  attr_reader :capacity, :airport_name

  def initialize(airport_name='undefined', capacity=DEFAULT_CAPACITY)
    @hangar = []
    @capacity = capacity
    @airport_name = airport_name
  end

  def land(plane)
    raise "Stormy weather!  Try again later." if stormy_weather?
    raise "Airport is full!" if full?
    plane.land
    plane.update_location @airport_name
    @hangar << plane
  end

  def takeoff(plane)
    raise "Stormy weather!  Try again later." if stormy_weather?
    raise "Plane not in this airport, either land here first or add a new plane to the airport!" unless @hangar.include?(plane)
    plane.takeoff
    @hangar.delete_if {|elem| elem == plane }
  end

  def stormy_weather?
    Random.rand(10).zero?  # 10% chance of storms?
  end

  def add_new_planes(plane)
    plane.update_location(@airport_name)
    @hangar << plane
  end

  private
  def full?
    @hangar.length >= @capacity
  end
end