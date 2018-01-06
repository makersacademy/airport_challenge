require './lib/weather.rb'

class Plane

  def initialize

  end

  def land
    true
  end

  def take_off(weather)
    p weather
    if weather.stormy == 0
      'take off'
      p weather
    else
      'stormy weather prevents take off'
      p weather
    end
  end

end
