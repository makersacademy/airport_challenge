class Plane
  attr_accessor :flight

  def initialize
    @flight = true
  end

  def landed
    @flight = false
  end

  def takeoff
    @flight = true
  end

end
