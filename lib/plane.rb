class Plane
  attr_reader :location 

  def initialize(location)
    @location = location
  end

  def takeoff
    raise("Plane is already flying") if location == :flying
    @location = :flying
  end

  def land(airport)
    raise("Plane is already landed") if location != :flying
    @location = airport
  end
end
