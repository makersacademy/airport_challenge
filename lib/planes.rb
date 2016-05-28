require 'weather'

class Planes

  def land(weather)
    @land = weather.report == "sunny" ? true : false
  end

  def take_off(weather)
    @land = weather.report == "sunny" ? false : true
  end

  def at_airport?
    @land
  end

end
