require_relative 'plane'
require_relative 'weather'

class Airport
  attr_reader :plane
  attr_reader :weather

  def land(plane, weather)
    @plane = plane
    @weather = weather
    raise "Stormy weather - plane may not land" if @weather.stormy?
    raise "The plane has landed at the airport"
  end

  def take_off(plane, weather)
    @plane = plane
    @weather = weather

    raise "Stormy weather - no take off allowed" if @weather.stormy?
    raise "The plane has successfully left the airport"
  end
end
