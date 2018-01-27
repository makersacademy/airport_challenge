class Plane

  def land(airport)
    fail 'No free spots avaialble' if airport.full?
    if !airport.planes_a.include?(self) && tell_weather() == "sunny" then
      airport.planes_a << self
    end
  end

  def take_off(airport)
    tell_weather == "sunny" && airport.planes_a.include?(self) ? airport.planes_a.delete(self) : "the plane cannot take off"
  end

  def random
    1 + rand(6)
  end

  def tell_weather
    random() == 1 ? "stormy" : "sunny"
  end

  def full?
    planes_a.count >= capacity
  end

end
