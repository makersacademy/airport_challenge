require_relative 'plane'

class Airport
  attr_reader :planes
  def initialize
    @planes = []
  end

  def land(plane)
    raise 'Airport is full to capacity' if @planes.count >= 2
    @planes << plane
  end

  def takeoffplane
    raise 'No planes available for takeoff' if @planes.empty?
    @planes.pop
  end

end

=begin
(PASS) Airport lands a Plane
(PASS) Airport returns landed planes
(PASS) Planes take off from airport
(TEST) Check plane removed from airport
=end
