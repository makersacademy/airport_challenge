require './lib/plane.rb'
require './lib/weather.rb'

class Airport
  attr_accessor :capacity
  attr_reader   :planes

  def initialize(capacity = 30)
    @planes = []
    @capacity = capacity
  end

  def land(plane)
    weather = Weather.new.weather
    raise "capacity has been reached" if full?
    raise "Plane not able to land due to storm" if weather == "stormy"
    raise "Plane has already landed" if plane.in_flight == false
    @planes << plane
    plane.land
    "The plane has landed"
  end

  def take_off(plane)
    weather = Weather.new.weather
    raise "Plane can not take off due to stormy weather" if weather == "stormy"
    raise "plane is in flight" if plane.in_flight == true
    plane.take_off
    @planes.delete(plane)
    "#{plane} has taken off"
  end

  def full?
    @planes.length == capacity
  end

end
