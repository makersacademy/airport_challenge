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
    weather = Weather.new
    permission = weather.weather
    puts "LOOK HERE"
    p permission
     if full?
       "capacity has been reached"
     elsif permission == "stormy"
       "Plane not able to land due to storm"
     else
       @planes << plane
     end
  end

  def take_off(plane)
    weather = Weather.new
    permission = weather.weather
    if permission == "stormy"
      "Plane can not take off due to stormy weather"
    else
    @planes.delete(plane)
    "#{plane} has taken off"
    end
  end

  def full?
    @planes.length == capacity
  end


end
