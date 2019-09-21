class Plane

  attr_accessor :airborne

  def initialize
    @airborne = true # a new plane assumed airborne upon instantiation
  end

  def land(airport)

    # Guard conditions
    fail "Cannot land due to stormy weather" if airport.weather == "stormy"
    fail "Cannot land as #{airport} is full" if airport.full?

    airport.planes << self
    self.airborne = false
  end

  def take_off(airport)

    # Guard conditions
    fail "Cannot take off due to stormy weather" if airport.weather == "stormy"
    fail "Plane is already airborne" if self.airborne == true
    fail "Plane is not in #{airport}" if !airport.planes.include?(self)

    self.airborne = true
  end

  def airborne?
    airborne
  end

end
