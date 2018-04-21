require 'weather'

class Airport
  attr_reader :planes

  def initialize
    @planes = []
  end

  def land(plane)
    fail 'This plane has already landed' if plane_in_airport?(plane)
    fail 'The weather does not permit landing' if weather.stormy?
    @planes << plane
    @planes
  end

  def take_off(plane)
    fail 'The weather does not permit take off' if weather.stormy?
    @planes.delete(plane)
    'This plane has left the airport'
  end

  def plane_in_airport?(plane)
    @planes.include?(plane)
  end

  private

  def weather
    Weather.new
  end

end
