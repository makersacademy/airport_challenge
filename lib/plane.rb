require './lib/weather.rb'

class Plane

  def initialize

  end

  def land
    true
  end

  def take_off(weather)
    if weather.stormy == 0
      'take off'
    else
      'stormy weather prevents take off'
    end
  end

end
