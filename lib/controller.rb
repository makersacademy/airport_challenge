require_relative 'airport'
require_relative 'weather'

class Controller

  attr_accessor :weather, :airport

  def initialize(weather: Weather.new, airport: Airport.new)
    @weather = weather
    @airport = airport
  end

  def land(plane)
    fail 'Can not land due to bad weather conditions' if @weather.stormy?
    fail 'Airport full!' if @airport.full?
    fail 'Plane is already in the airport' if @airport.planes.include?(plane)
    if plane.status != :untracked
      fail 'Plane has already landed' unless plane.in_the_air?
    end
    plane.flight(:landed)
    @airport.track(plane)
  end

  def take_off(plane)
    fail 'Can not take off due to bad weather conditions' if @weather.stormy?
    fail 'Plane is not in the airport' unless @airport.planes.include?(plane)
    if plane.status != :untracked
      fail 'Plane is already in the air' if plane.in_the_air?
    end
    plane.flight(:taken_off)
    @airport.track(plane)
  end

end
