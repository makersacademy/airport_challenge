require_relative 'plane'

class Airport

  attr_reader :hanger
  
  def initialize
    @hanger = []
  end

  def land(plane)
    @hanger.push(plane)
    return @hanger
  end

  def takeoff
    @hanger.pop
  end
end
