require_relative './plane.rb'

class Airport

  def initialize
    @hanger = []
  end

  def land(plane)
    @hanger << plane
  end

end
