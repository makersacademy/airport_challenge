class Plane
  attr_accessor :airborne

  def initialize(airborne = false)
    @airborne = airborne
  end

  def airborne?
    airborne
  end

  def on_land
    airborne
  end

  def in_air
    self.airborne = true
    self
  end

  def status
    airborne? ? "The plane is in the air" : "The plane is on land"
  end
end
