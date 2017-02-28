class Plane

  attr_reader :in_flight

  def initialize
    @in_flight = true
  end

  def flying
    @in_flight = true
  end

  def land
    @in_flight = false
  end

end
