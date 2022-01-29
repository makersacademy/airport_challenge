require './lib/plane.rb'

class AirPort

  def initialize
    @hanger = []
  end

  def land(plane)
    @hanger << (plane)
  end

end
