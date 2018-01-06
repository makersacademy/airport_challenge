require './lib/weather.rb'
require './lib/airport.rb'

class Plane

  def initialize

  end

  def land(weather)
    if weather.stormy.zero?
      'land'
    else
      'stormy weather prevents landing'
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
