require_relative 'plane'

class Airport

  attr_reader :plane

  def land(plane)
    fail 'Landing not possible, airport full.' if @plane
    @plane = plane
  end

  def take_off
    plane
  end

end
