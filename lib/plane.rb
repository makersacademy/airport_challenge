class Plane

  def initialize(location = :in_air)
    @location = location
  end

  def land(airport)
    fail "Cannot land a plane that is not flying" unless location == :in_air
    @location = airport
  end

  def takeoff(airport)
    fail "Cannot takeoff a plane that is already flying" if location == :in_air
    @location = :in_air
  end

  def status
    location == :in_air ? "Plane is flying" : "Plane is at airport #{location.name}"
  end

  private
  attr_reader :location

end
