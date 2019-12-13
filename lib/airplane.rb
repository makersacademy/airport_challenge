class Airplane
  attr_reader :location

  def land_at(airport)
    raise("Airport is full") if airport.planes.count == 1
    @location = airport
  end

  def takeoff
    @location = "sky"
  end
end
