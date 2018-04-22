require_relative 'plane'
require_relative 'weather'

class Airport

  DEFAULT_CAPACITY = 3
  attr_reader :hangar
  attr_accessor :capacity

  def initialize(capacity = DEFAULT_CAPACITY)
    @capacity = capacity
    @hangar = []
  end

  def land(plane)
    raise "Unable to land due to weather conditions" if stormy?
    raise "Unable to land. Hangar is full" if full_capacity?

    @hangar << plane
  end

  def takeoff(plane)
    raise "Unable to takeoff due to weather conditions" if stormy?
    raise "Plane not available in hangar for takeoff" unless available?(plane)

    @hangar.delete(plane) if available?(plane)
    "The #{plane} is no longer in the Airport"
  end

  private

  def stormy?
    weather_conditions = Weather.new
    weather_conditions.generate == "stormy"
  end

  def available?(plane)
    @hangar.include?(plane)
  end

  def full_capacity?
    @hangar.length >= @capacity
  end

end
