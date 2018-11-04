class Plane
  attr_accessor :in_flight
  def initialize
    @in_flight = true
  end

  def ground_plane
    @in_flight = false
    self
  end

end
