require 'weather'

class Airport
  LANDING_ERROR_MESSAGE = 'You cannot land' 
  TAKEOFF_ERROR_MESSAGE = 'You cannot takeoff' 

  attr_reader :plane 

  def land(plane)
    raise LANDING_ERROR_MESSAGE if stormy?

    @plane = plane
  end

  def takeoff
    raise TAKEOFF_ERROR_MESSAGE if stormy?

    @plane = nil
  end

  private

  def stormy?
    Weather.current == 'stormy'
  end
end
