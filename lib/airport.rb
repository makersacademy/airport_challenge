require_relative 'communicator'

class Airport
  include Communicator
  attr_reader :weather, :capacity, :planes
  DEFAULT_CAPACITY = 30

  def initialize(capacity = DEFAULT_CAPACITY)
    @capacity = capacity
    @planes = []
    return @weather = "stormy" if Random.rand > 0.9 #I'm thinking weather should just be inherited from weatherclass?
    @weather = "sunny"
  end

  def dock(plane)
    raise "Can't dock a flying plane" if plane.flying?
    @planes << plane
  end

  def undock(plane)
    raise "Can't undock a plane that is not here" if plane.flying?
    planes.delete(plane)
  end

  def full?
    planes.length == capacity
  end

  private
  attr_writer :weather, :capacity, :planes

end
