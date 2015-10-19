require_relative 'plane'
require_relative 'weather'

class Airport

DEFAULT_CAPACITY = 20

  attr_reader :capacity, :airport_name

  def initialize(airport_name='undefined', capacity=DEFAULT_CAPACITY,conditions=Weather.new)
    @hangar = []
    @capacity = capacity
    @airport_name = airport_name
    @conditions = conditions
  end

  def land(plane)
    raise "Stormy weather!  Try again later." if condition_check == :stormy
    raise "Airport is full!" if full?
    plane.land
    plane.update_location @airport_name
    @hangar << plane
  end

  def takeoff(plane)
    raise "Stormy weather!  Try again later." if condition_check == :stormy
    raise "Plane is not in this airport, either land here first or add a new plane to the airport!" unless @hangar.include?(plane)
    plane.takeoff
    @hangar.delete_if {|elem| elem == plane }
  end

  def add_new_planes(plane)
    plane.update_location(@airport_name)
    @hangar << plane
  end

  private
  def full?
    @hangar.length >= @capacity
  end

  def condition_check
    @conditions.weather_check
  end
end