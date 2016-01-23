class Plane

  attr_reader :in_flight, :landed

  def initialize
    @in_flight = true
    @landed = false
  end

  def land
    @in_flight = false
    @landed = true
  end

  def take_off
    @in_flight = true
    @landed = false
  end

end
