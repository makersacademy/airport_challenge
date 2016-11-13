require_relative 'plane'

class Airport

  def initialize
    @planes = []
  end

  def take_off(plane)
    return true if plane.flying == false #meaning if plane is not flying it can take off
  end



end
