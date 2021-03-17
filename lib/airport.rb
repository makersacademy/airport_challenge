require_relative './plane'
require_relative './weather'
class Airport

  attr_reader :hangar
 
  def initialize(capacity = 10)
    @capacity = capacity
    @hangar = []
    @weather = Weather.new
  end

  def land_plane(plane)
    @weather.update_weather
    fail 'Plane is already in hangar' if @hangar.include?(plane)
    fail 'It is too stormy' unless @weather.stormy == false
    fail 'Airport is full' unless @hangar.length < @capacity   

    @hangar.append(plane)
  end

  def take_off(plane)
    @weather.update_weather
    fail 'Plane is not in hangar' unless @hangar.include?(plane)
    fail 'It is too stormy' unless @weather.stormy == false

    @hangar.delete(plane)
  end

end