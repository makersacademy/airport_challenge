require_relative 'plane'
require_relative 'weather'

class AirPort

  
  attr_reader :landing_bays
  attr_accessor :capacity
  DEFAULT_CAPACITY = 50
  
  def initialize(capacity = DEFAULT_CAPACITY)
    @capacity = capacity
    @landing_bays = []
    @weather_conditions = Weather.new
  end

def land(plane)
    raise "Unable to land due to weather conditions" if stormy?
    @landing_bays << plane
  end

  def takeoff(plane)
    raise "Unable to take off due to weather conditions" if stormy?
    @landing_bays.pop
    "The #{plane} is no longer in the Airport"
  end

  private

  def stormy?
    @weather_conditions.produce == "stormy"
  end

end