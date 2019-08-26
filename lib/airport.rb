require_relative 'plane'

class Airport

  def weather 
    rand(1..8) > 1 ? @weather = 'sunny' : @weather = 'stormy'
  end 

  def take_off(plane)
    fail 'Cannot take off due to stormy weather' unless weather == 'sunny'
  end

  def land(plane)
    fail 'Cannot land due to stormy weather' unless weather == 'sunny'
  end
end 
