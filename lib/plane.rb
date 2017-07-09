class Plane

  def initialize(location = :in_air)
    @location = location
  end

  def land(airport)
    fail "Cannot land a plane that is not flying" unless location == :in_air
    @location = airport
  end

  def takeoff(airport)
    fail_if_flying
    fail_if_different_airport(airport)
    fail_if_stormy
    @location = :in_air
  end

  def status
    location == :in_air ? "Plane is flying" : "Plane is at airport #{location.name}"
  end

  private
  attr_reader :location

  def fail_if_flying
    fail "Cannot takeoff a plane that is already flying" if location == :in_air
  end

  def fail_if_different_airport(airport)
    fail "Cannot takeoff from a different airport" unless location.name == airport.name
  end

  def fail_if_stormy
    fail "Cannot takeoff in stormy weather" if location.weather.stormy?
  end

end
