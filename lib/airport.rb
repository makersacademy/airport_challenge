require_relative 'plane'
require_relative 'weather'

class Airport

  include Weather
  attr_reader :planes
  attr_accessor :capacity, :airport_name
  DEFAULT_PLANES = 10
  DEFAULT_CAPACITY = 20

  def initialize(airport_name, capacity = DEFAULT_CAPACITY,
                  no_of_planes = DEFAULT_PLANES)
    check_arguments(airport_name, capacity, no_of_planes)
    @airport_name = airport_name
    @capacity = capacity
    @planes = Array.new(no_of_planes, Plane.new(airport_name))
  end

  def land(plane)
    raise 'Plane already in airport' if planes.include?(plane)
    check_airport_full
    check_weather
    plane.land_at(airport_name)
    raise 'Problem with landing' unless plane.in_airport?(airport_name)
    planes << plane
  end

  def take_off(plane)
    raise 'Plane not in airport' unless planes.include?(plane)
    check_weather
    plane.fly
    raise 'Problem with take off' if plane.in_airport?(airport_name)
    planes.delete(plane)
  end

  def plane_count
    planes.count
  end

  private

  def check_arguments(airport_name, capacity, no_of_planes)
    raise "Please enter a name for the airport" if airport_name.nil?
    raise ArgumentError.new("no_of_planes exceeds capacity") if no_of_planes > capacity
  end

  def check_weather
    raise "All flights cancelled due to stormy weather" if stormy?
  end

  def check_airport_full
    raise 'Airport is full' if plane_count == capacity
  end

end
