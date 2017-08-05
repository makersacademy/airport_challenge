class Plane

  attr_accessor :airport, :status

  def initialize(airport, status = "on the ground")
    @airport = airport
    @status = status
  end

  def land
    @status = "on the ground"
    "plane has landed"
  end

  def take_off
    if airport.weather == "stormy"
      "too stormy to fly"
    else
      @status = "in the air"
      @airport = nil
      "plane has taken off"
    end
  end

end
