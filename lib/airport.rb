require_relative 'plane'


class Airport
    attr_reader :planes
    attr_accessor :capacity

  DEFAULT_CAPACITY = 20

  def initialize(capacity = DEFAULT_CAPACITY)
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
    @planes.length >= DEFAULT_CAPACITY
  end


  #def plane
  #  @plane
  #end

end
