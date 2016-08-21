# Creates an airport object which can land/takeoff plane objects.
class Airport
  require_relative 'weather'
  require_relative 'plane'
  DEFAULT_CAPACITY = 6

  def initialize(options = {})
    @capacity = options.fetch(:capacity, DEFAULT_CAPACITY)
    @weather = options.fetch(:weather_system, Weather.new)
    @landed_planes = []
  end

  def land(plane)
    pre_landing_checks(plane)
    plane.land
    add_plane_to_airport(plane)
    puts "The plane has landed safely at the airport."
  end

  def takeoff(plane)
    pre_takeoff_checks(plane)
    plane.takeoff
    remove_plane_from_airport(plane)
    puts "The plane has successfully taken off."
  end

  private

  attr_reader :capacity, :weather, :landed_planes

  def pre_landing_checks(plane)
    fail "That plane is at another airport." if plane_landed?(plane)
    fail 'Airport is full, the plane has diverted.' if airport_full?
    fail 'Poor weather means the plane has to divert.' unless weather_safe?
  end

  def pre_takeoff_checks(plane)
    fail 'That plane is currently flying' unless plane_landed?(plane)
    fail 'That plane is at another airport' unless at_airport?(plane)
    fail 'Poor weather means the plane can not takeoff.' unless weather_safe?
  end

  def add_plane_to_airport(plane)
    landed_planes << plane
  end

  def remove_plane_from_airport(plane)
    landed_planes.delete(plane)
  end

  def at_airport?(plane)
    landed_planes.include? plane
  end

  def plane_landed?(plane)
    plane.landed?
  end

  def weather_safe?
    weather.check_safe?
  end

  def airport_full?
    landed_planes.length >= capacity
  end
end
