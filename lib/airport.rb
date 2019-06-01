require './lib/plane.rb'

class Airport
  attr_reader :hanger

  def initialize
  @hanger = []
  end

  def land(plane)
    @hanger.push(plane)
  end

  def takeoff(plane)
    @hanger.delete(plane)
  end

end
