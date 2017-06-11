class Plane
  attr_accessor :airborne

  def initialize
    @airborne = true
  end

  def airborne?
    @airborne
  end

  def on_land
    @airborne = false
  end

  def in_air
    @airborne = true
  end

  def status
    airborne? ? "The plane is in the air" : "The plane is on land"
  end
end
