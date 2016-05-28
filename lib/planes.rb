require 'weather'

class Planes

  def land(weather)
    weather.report == "sunny" ? @land = true : @land = false
  end

  def take_off(weather)
    weather.report == "sunny" ? @land = false : @land = true
  end

  def at_airport?
    @land
  end

end
