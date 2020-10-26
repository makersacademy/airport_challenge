class Plane

  def land(airport)
    raise "WEATHER IS STORMY - CANNOT LAND" if airport.weather == :stormy
    raise "PLANE ALREADY LANDED" if airport.planes.include?(self)
    raise "AIRPORT FULL" unless airport.planes.length < airport.capacity

    airport.planes << self
    puts "PLANE LANDED SUCCESSFULLY"
  end

  def take_off(airport)
    raise "WEATHER IS STORMY - CANNOT TAKE OFF" if airport.weather == :stormy
    raise "AIRPORT EMPTY" if airport.planes.empty?
    raise "PLANE NOT AT AIRPORT" unless airport.planes.include?(self)

    airport.planes.delete(self)
    puts "PLANE TAKEN OFF SUCCESSFULLY"
  end
end
