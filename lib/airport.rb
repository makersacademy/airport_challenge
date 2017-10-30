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
    raise "Plane not able to land due to storm"  if weather == "stormy"
    @planes << plane
  end

  def take_off(plane)
    weather = Weather.new.weather
    raise "Plane can not take off due to stormy weather"  if weather == "stormy"
    @planes.delete(plane)
    "#{plane} has taken off"
  end

  def full?
    @planes.length == capacity
  end


end
