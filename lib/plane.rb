class Plane

  DEFAULT_STATUS="flying"

  attr_accessor :status

  def initialize(status=DEFAULT_STATUS)
    @status = status
  end

  def land(airport)
    fail 'No free spots avaialble at this airport' if airport.full?
    fail 'The plane is already at an airport' if self.status == "at_airport"
    if self.status != "at_airport" && !airport.planes_a.include?(self) && tell_weather() == "sunny" then
      self.status = "at_airport"
      airport.planes_a << self
    end
  end

  def take_off(airport)
    fail 'The plane is already flying' if self.status == "flying"
    fail 'This plane is not at this airport' if !airport.planes_a.include?(self)
    if self.status == "at_airport" && tell_weather == "sunny" && airport.planes_a.include?(self) then
       self.status = "flying"
       airport.planes_a.delete(self)
    else
      "The plane cannot take off"
    end
  end

  def random
    1 + rand(6)
  end

  def tell_weather
    random() == 1 ? "stormy" : "sunny"
  end

end
