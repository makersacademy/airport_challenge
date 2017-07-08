require_relative 'plane'
require_relative 'weather'

class Airport

  include Weather
  attr_reader :planes
  attr_accessor :capacity, :airport_name
  DEFAULT_CAPACITY = 20

  def initialize (no_of_planes = 10, capacity = DEFAULT_CAPACITY, airport_name = "undefined")
    raise ArgumentError.new("Number of planes exceeds capacity of airport") if no_of_planes > capacity
    @capacity = capacity
    @planes = Array.new(no_of_planes, Plane.new)
    @airport_name = airport_name
  end

  def land plane
    raise "Landing prevented due to stormy weather" if stormy?
    raise 'Airport is full' if full?
    plane.land (airport_name)
    raise 'Problem with landing' if plane.status != "In Airport"
    planes << plane
  end

  def take_off (plane, destination = "")
    raise "Take off prevented due to stormy weather" if stormy?
    plane.take_off (destination)
    raise 'Problem with take off' if plane.status != "Flying"
    planes.delete(plane)
  end

  private

  def full?
    planes.count == capacity
  end

end
