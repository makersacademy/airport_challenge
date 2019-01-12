require 'weather'

class Airport
  LANDING_ERROR_MESSAGE = 'You cannot land' 
  TAKEOFF_ERROR_MESSAGE = 'You cannot takeoff'

  DEFAULT_CAPACITY = 1

  attr_reader :planes, :capacity
  attr_writer :capacity

  def initialize
    @capacity = DEFAULT_CAPACITY
    @planes = []
  end

  def land(plane)
    raise LANDING_ERROR_MESSAGE if stormy?
    raise LANDING_ERROR_MESSAGE if @planes.length >= @capacity

    @planes << plane
  end

  def takeoff(plane)
    raise TAKEOFF_ERROR_MESSAGE if stormy?

    @planes.delete(plane)
  end

  private

  def stormy?
    Weather.current == 'stormy'
  end
end
