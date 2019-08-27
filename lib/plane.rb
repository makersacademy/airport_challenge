class Plane

  attr_reader :flying

  def initialize
    @flying = false
  end

  def land_at(airport, weather)
    fail 'Landing not allowed due to stormy weather' if weather.stormy? == true

    airport.land(flying_state(false))
    "Plane has landed"
  end

  def take_off_from(airport, weather)
    fail 'Plane has already taken off' if in_air? == true

    fail 'Take off not allowed due to stormy weather' if weather.stormy? == true

    airport.takeoff(flying_state(true))
    "Plane has taken off"
  end

  def flying_state(state)
    @flying = state
  end

  def in_air?
    @flying == true
  end

end
