require_relative 'plane'

class Airport
  attr_reader :plane

  def land(plane)
    raise 'Airport is full to capacity' if @plane
    @plane = plane
  end

  def takeoffplane
    raise 'No planes available for takeoff' unless @plane
    @plane
  end

end

=begin
(PASS) Airport lands a Plane
(PASS) Airport returns landed planes
(PASS) Planes take off from airport
(TEST) Check plane removed from airport
=end
