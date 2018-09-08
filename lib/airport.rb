require 'plane'

class Airport

  def initialize
    @hanger = []
  end

  def land(plane)
    @hanger << plane
  end

  def take_off(plane)
    @hanger.delete(plane)
    plane
  end

end
