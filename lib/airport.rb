require_relative 'plane'

class Airport

  def initialize
    @planes = []
  end 

  def weather 
    rand(1..8) > 1 ? @weather = 'sunny' : @weather = 'stormy'
  end 

  def take_off(plane)
    fail 'Cannot take off due to stormy weather' unless weather == 'sunny'
    plane.take_off
  end

  def land(plane)
    fail 'Cannot land due to stormy weather' unless weather == 'sunny'
    @planes << plane
  end
end 
