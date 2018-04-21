require 'weather'

class Airport
  attr_reader :planes

  def initialize
    @planes = []
  end

  def land(plane)
    @planes << plane
    @planes
  end

  def take_off(plane)
    fail 'The weather does not permit take off' if weather.stormy?
    @planes.delete(plane)
    'This plane has left the airport'
  end

  private

  def weather
    Weather.new
  end

end
