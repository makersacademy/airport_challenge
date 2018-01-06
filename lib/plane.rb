require './lib/weather.rb'
require './lib/airport.rb'

class Plane

  def initialize

  end

  def land(weather, airport)
    if weather.stormy == 1
      'stormy weather prevents landing'
    elsif weather.stormy.zero? && airport.capacity == false
      'airport full, cannot land'
    elsif weather.stormy.zero? && airport.capacity == true
      'land'
    end
  end

  def take_off(weather)
    if weather.stormy.zero?
      'take off'
    else
      'stormy weather prevents take off'
    end
  end
end
