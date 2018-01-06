require_relative 'plane'
require_relative 'weather'

class Airport
  attr_reader :plane
  attr_reader :weather

  def land(plane)
    @plane = plane
  end

  def take_off(plane, weather)
    @plane = plane
    @weather = weather

    raise "Stormy weather - no take off allowed" if @weather.stormy?
    raise "The plane has successfully left the airport" 
  end
end
