class Plane

  def land(airport, weather)
    raise "plane has already landed" if airport.hanger.include? self
    raise "hanger is full" if airport.full?
    raise "bad weather: can't land" unless weather == true
    airport.hanger << self
  end

  def take_off(airport, weather)
    raise "that plane is not here" unless airport.hanger.include? self
    raise "no planes in hanger" if airport.empty?
    raise "bad weather: can't take-off" unless weather == true
    p "The plane #{self} is no longer at #{airport}"
    airport.hanger -= [self]
  end

end
