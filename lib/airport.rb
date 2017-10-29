require './lib/plane.rb'

class Airport
attr_accessor :capacity
attr_reader   :planes

  def initialize(capacity = 30)
    @planes = []
    @capacity = capacity
  end

  def land(plane, weather = "sunny")
     if full?
       "capacity has been reached"
     elsif weather == "stormy"
       "Plane not able to land due to storm"
     else
       @planes << plane
     end
  end

  def take_off(plane, weather = "sunny")
    if weather == "stormy"
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
