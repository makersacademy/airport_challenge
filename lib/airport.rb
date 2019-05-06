require_relative 'plane'

class Airport
  attr_reader :hanger
  def initialize
    @hanger = []
  end

  def land(plane)
    @hanger << plane
  end

  def takeoff(plane)
    @hanger.pop
  end
end
