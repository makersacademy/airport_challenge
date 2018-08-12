class Plane

  def land(airport, weather)
    raise "hanger is full" if airport.full?
    raise "bad weather: can't land" unless weather == true
    airport.hanger << self
  end

  def take_off(airport, weather)
    raise "no planes in hanger" if airport.empty?
    raise "bad weather: can't take-off" unless weather == true
    raise "#{self} is not at #{airport}" if airport.hanger.include? self == false
    p "The plane #{self} is no longer at #{airport}"
    airport.hanger -= [self]
  end


end
