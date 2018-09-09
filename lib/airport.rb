require_relative 'plane'

class Airport

  DEFAULT_HANGER_CAPACITY = 20

  GUARDS = {
    airborne: "Cannot takeoff. Plane already airborne",
    on_ground: "Cannot land. Plane already on the ground",
    on_site: "Plane at wrong airport",
    weather_takeoff: "The weather is too bad to fly",
    weather_landing: "The weather is too bad to land",
    full_hanger: "The plane can't land because the hanger is full"
  }

  def initialize(capacity = DEFAULT_HANGER_CAPACITY)
    @hanger = []
    @capacity = capacity
  end

  def land(plane)
    return @guard if landing_guards(plane)
    plane.grounded(self)
    @hanger << plane
  end

  def takeoff(plane)
    return @guard if takeoff_guards(plane, self)
    @hanger.delete(plane)
    plane.airborne
  end

private

  def landing_guards(plane)
    return @guard = GUARDS[:on_ground] if plane_grounded?(plane)
    return @guard = GUARDS[:weather_landing] if bad_weather?
    return @guard = GUARDS[:full_hanger] if hanger_full?
  end

  def plane_grounded?(plane)
    true unless plane.location == "Airborne"
  end

  def hanger_full?
    @hanger.count == @capacity
  end

  def bad_weather?
    rand(10).zero?
  end

  def takeoff_guards(plane, airport)
    return @guard = GUARDS[:airborne] if plane_airborne?(plane)
    return @guard = GUARDS[:on_site] unless plane_at_airport?(plane, airport)
    return @guard = GUARDS[:weather_takeoff] if bad_weather?
  end

  def plane_airborne?(plane)
    true if plane.location == "Airborne"
  end

  def plane_at_airport?(plane, airport)
    true if plane_on_site?(plane, airport) || new_plane?(plane)
  end

  def plane_on_site?(plane, airport)
    plane.location == airport
  end

  def new_plane?(plane)
    plane.location == "The Factory"
  end

end
