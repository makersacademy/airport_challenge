class Plane

  DEFAULT_STATUS="flying"

  attr_accessor :status
  attr_reader :random
  attr_reader :tell_weather

  def initialize
    @status = DEFAULT_STATUS
  end

  def land(airport)
    fail 'No free spots avaialble at this airport' if airport.full?
    fail 'Weather is stormy - cannot land' if airport.tell_weather == "stormy"
    fail 'The plane is already at an airport' if self.status == "at_airport"
    self.status = "at_airport"
    airport.planes_a << self
  end

  def take_off(airport)
    fail 'The plane is already flying' if self.status == "flying"
    fail 'This plane is not at this airport' if !airport.planes_a.include?(self)
    fail 'Weather is stormy - cannot take off' if airport.tell_weather == "stormy"
    self.status = "flying"
    airport.planes_a.delete(self)
  end

end
