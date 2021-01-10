require_relative 'plane'

class Airport
    attr_reader :planes
    attr_accessor :capacity

  def initialize(capacity = 20)
    @planes = []
    @capacity = capacity
  end

  def land(plane)
    fail "Airport is full" if full?
    @planes << plane
  end

  def take_off
    #Plane.new
    @planes
  end

  private

  def full?
    @planes.length >= 1
  end


  #def plane
  #  @plane
  #end

end
