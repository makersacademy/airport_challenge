require 'plane'

class Airport

  def initialize
    @hanger = []
  end

  def land(plane)
    @hanger << plane
  end

end
