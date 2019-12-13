require './lib/plane.rb'

class Airport

  def initialize
    @airport = nil
  end

  def land(plane)
     @airport = plane
  end


  def take_off(plane)
    0
  end


end
