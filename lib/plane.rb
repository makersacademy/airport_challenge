class Plane
  attr_reader :location

  def initialize(location)
    @location = location
  end

  def land(airport)
    raise("Warning: plane is not airborne") if @location != "airborne"
    @location = airport
  end
end
