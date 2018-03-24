require_relative 'plane'

class Airport
  attr_reader :plane

  def land(plane)
    @plane = plane
  end

end

=begin
(PASS) Airport lands a Plane
(PASS) Airport returns landed planes
(TEST) Planes take off from airport
=end
