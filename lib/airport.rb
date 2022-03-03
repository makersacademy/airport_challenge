require 'plane'
require 'weather'

class Airport
  DEFAULT_CAPACITY = 20
  TAKE_OFF_MESSAGE = 'Plane has left the airport'
  STORMY_LAND_MESSAGE = 'Plane unable to land due to stormy weather'
  STORMY_TAKE_OFF_MESSAGE = 'Plane unable to take off due to stormy weather'
  LANDING_ERROR_MESSAGE = 'Plane already in airport'
  TAKE_OFF_ERROR_MESSAGE = 'Plane already took off'

  def initialize(capacity = DEFAULT_CAPACITY, weather: Weather.new)
    @hangar = []
    @capacity = capacity
    @weather = weather
  end

  def hangar
    @hangar
  end

  def land(plane)
    raise 'Hangar full' if @hangar.count == DEFAULT_CAPACITY
    raise LANDING_ERROR_MESSAGE if plane.landed? == true
    raise STORMY_LAND_MESSAGE if stormy?
    @hangar << plane
  end

  def take_off(plane)
    raise STORMY_TAKE_OFF_MESSAGE if stormy?
    raise TAKE_OFF_ERROR_MESSAGE if plane.landed? == false
    @hangar.delete(plane)
    TAKE_OFF_MESSAGE
  end
  
  private

  def stormy?
    @weather == 'stormy'
  end

end