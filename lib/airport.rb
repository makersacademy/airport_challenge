require './lib/plane'

class Airport
  attr_reader :hanger

  def initialize
    @hanger = []
  end

  def land(plane_to_land)
    @hanger << plane_to_land
  end

  def take_off
    @hanger.pop
  end
end
