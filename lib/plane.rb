class Plane
  attr_accessor :flight

  def initialize
    @flight
  end

  def landed
    @flight = false
  end

  def takeoff
    @flight = true
  end

end
