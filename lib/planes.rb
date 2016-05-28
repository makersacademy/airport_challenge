require_relative 'weather'

class Plane

  def initialize
    @land = false
  end

  def land(weather)
    fail "Plane has already landed." if at_airport?
    @land = weather.state == "sunny" ? true : false
    return at_airport? ? "The plane has successfully landed." : "The plane could not land due to adverse weather conditions."
  end

  def take_off(weather)
    fail "Plane has already taken off." if !at_airport?
    @land = weather.state == "sunny" ? false : true
    return !at_airport? ? "The plane has successfully taken_off." : "The plane could not take_off due to adverse weather conditions."
  end

  def at_airport?
    @land
  end

end
