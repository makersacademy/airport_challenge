require_relative 'plane'

class Airport
    attr_reader :planes
    attr_reader :capacity

  def initialize(capacity = 20)
    @planes = []
    @capacity = capacity
  end

  def land(plane)
    @planes << plane
  end

  def take_off
    #Plane.new
    @planes
  end

  #def plane
  #  @plane
  #end

end
