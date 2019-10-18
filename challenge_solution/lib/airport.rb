require "./lib/aeroplane"

class Airport
  attr_accessor :landed

  def initialize
    @landed = []
  end

  def land(aeroplane)
    @landed << aeroplane
  end
end
