class Plane

  attr_reader :in_flight

  def initialize
    @in_flight = true
  end

  def ground
    @in_flight = false
  end

  def fly
    @in_flight = true
  end

end
