require_relative './plane'

class Airport
  def initialize
    @landed = []
  end
  def land(plane)
    @landed << plane
  end
end