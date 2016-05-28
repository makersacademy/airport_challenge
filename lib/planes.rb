require 'weather'

class Planes

  def land(weather)
    @land = weather.state == "sunny" ? true : false
  end

  def take_off(weather)
    @land = weather.state == "sunny" ? false : true
  end

  def at_airport?
    @land
  end

end
