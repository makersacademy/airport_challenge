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
    clear_for_landing(plane)
    plane.land_at(airport_name)
    raise 'Problem with landing' unless plane.in_airport?(airport_name)
    planes << plane
  end

  def take_off(plane)
    clear_for_take_off(plane)
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
    if no_of_planes > capacity
      raise ArgumentError.new("Number of planes exceeds capacity of airport")
    end
  end

  def clear_for_take_off(plane)
    check_weather
    raise "Plane not in airport" unless in_airport?(plane)
  end

  def clear_for_landing(plane)
    check_weather
    raise 'Plane already in airport' if in_airport?(plane)
    raise 'Airport is full' if full?
  end

  def check_weather
    raise "All flights cancelled due to stormy weather" if stormy?
  end

  def in_airport?(plane)
    planes.include?(plane) or plane.in_airport?(airport_name)
  end

  def full?
    plane_count == capacity
  end

end
