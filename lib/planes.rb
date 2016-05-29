require_relative 'traffic_control'

class Plane

  def initialize
    @land = false
  end

  def land(traffic_control)
    fail "Plane has already landed." if at_airport?
    @land = (traffic_control.permission?) ? true : false
    @land == true ? "Plane has landed." : "Plane could not land due to stormy weather."
  end

  def take_off(traffic_control)
    fail "Plane has already taken off." unless at_airport?
    @land = (traffic_control.permission?) ? false : true
    @land == false ? "Plane has taken off." : "Plane could not take off due to stormy weather."
  end

  def at_airport?
    @land
  end


end
