require_relative 'plane'

class Airport
  attr_reader :planes
  def initialize
    @planes = []
  end

  def land(plane)
    raise 'Airport is full to capacity' if full?
    @planes << plane
  end

  def takeoffplane
    raise 'No planes available for takeoff' if empty?
    @planes.pop
  end

  def full?
    @planes.count == 2
  end

  def empty?
    @planes.empty?
  end

end

=begin
(PASS) Airport lands a Plane
(PASS) Airport returns landed planes
(PASS) Planes take off from airport
(PASS) Check plane removed from airport
=end
