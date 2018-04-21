require_relative 'plane'
require_relative 'weather'

class Airport

  DEFAULT_CAPACITY = 30
  attr_reader :holding
  attr_accessor :capacity

  def initialize(capacity = DEFAULT_CAPACITY)
    @capacity = capacity
    @holding = []
  end

  def land(plane)
    raise "Unable to land due to weather conditions" if stormy?
    @holding << plane
  end

  def takeoff(plane)
    raise "Unable to take off due to weather conditions" if stormy?
    "The #{plane} is no longer in the Airport"
  end

  private

  def stormy?
    weather_conditions = Weather.new
    weather_conditions.generate == "stormy"
  end

end
