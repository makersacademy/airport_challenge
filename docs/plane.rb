class Plane

attr_accessor :in_flight

  def initialize
    @in_flight = true
  end

  def flying?
    in_flight
  end

end
