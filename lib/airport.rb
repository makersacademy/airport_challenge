require_relative 'plane'

class Airport
  attr_reader :plane

  def land(plane)
    @plane = plane
  end

  def take_off(plane)
    @plane = plane
    raise "The plane is no longer in the airport"
  end
end
