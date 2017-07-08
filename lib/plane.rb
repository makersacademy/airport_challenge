class Plane

  def initialize(location = :in_air)
    @location = location
  end

  def land(airport)
    fail "Cannot land a plane that is not flying" unless location == :in_air
    @location = airport
  end

  def takeoff(airport)
    @location = :in_air
  end

  def status
    location == :in_air ? "Plane is flying" : "Plane is at airport #{location.name}"
  end

  private
  attr_reader :location

end
