
class Plane

  attr_reader :in_flight

  def initialize
    @in_flight = true
  end

  def landed
    @in_flight = false
  end

  def took_off
    @in_flight  = true
  end

end
