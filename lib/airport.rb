require_relative 'plane'

class Airport
  attr_reader :plane

  def land(plane)
    @plane = plane
  end

  def takeoffplane
    Plane.new
  end

end

=begin
(PASS) Airport lands a Plane
(PASS) Airport returns landed planes
(PASS) Planes take off from airport
(TEST) Check plane removed from airport
=end
