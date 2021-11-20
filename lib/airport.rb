require_relative './plane'

class Airport
  attr_reader :landed
  def initialize
    @landed = []
  end
  
  def land(plane)
    @landed << plane
  end

  def departure
    @landed.shift
  end
end