require './lib/plane'

class Airport
attr_reader :landed

  def initialize
    @landed = []
    @weather = rand(10)
  end

  def land(plane)
    landed << plane
  end


  def take_off
    landed.pop
  end




end
