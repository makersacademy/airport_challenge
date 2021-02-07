require_relative 'plane'

class Airport

  def initialize(hanger = [])
    @hanger = []
  end

  def land(plane)
    @hanger << plane
  end

  def take_off(plane)
  end


end
