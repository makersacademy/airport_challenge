require 'weather'

class Airport
  LANDING_ERROR_MESSAGE = 'Aircraft Cannot Land' 
  TAKEOFF_ERROR_MESSAGE = 'Aircraft Cannot Takeoff'
  AIRCRAFT_NOT_HERE_ERROR_MESSAGE = 'Aircraft Not Here'
  ALREADY_LANDED_ERROR_MESSAGE = 'Aircraft Already Landed'

  DEFAULT_CAPACITY = 1

  attr_reader :planes, :capacity
  attr_writer :capacity

  def initialize
    @capacity = DEFAULT_CAPACITY
    @planes = []
  end

  def land(plane)
    raise ALREADY_LANDED_ERROR_MESSAGE if @planes.include? plane
    raise LANDING_ERROR_MESSAGE if stormy?
    raise LANDING_ERROR_MESSAGE if @planes.length >= @capacity

    @planes << plane
  end

  def takeoff(plane)
    raise AIRCRAFT_NOT_HERE_ERROR_MESSAGE unless @planes.include? plane
    raise TAKEOFF_ERROR_MESSAGE if stormy?

    @planes.delete(plane)
  end

  private

  def stormy?
    Weather.current == 'stormy'
  end
end
