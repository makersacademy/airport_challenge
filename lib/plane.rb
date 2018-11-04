class Plane
  attr_accessor :in_flight
  def initialize
    @in_flight = true
  end

  def ground_plane
    @in_flight = false
    self
  end

  def unground_plane
    @in_flight = true
    self
  end

end
