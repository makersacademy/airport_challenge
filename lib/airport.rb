require_relative 'communicator'

class Airport
  include Communicator
  attr_reader :weather, :capacity, :planes
  attr_writer :capacity
  DEFAULT_CAPACITY = 30

  def initialize(capacity = DEFAULT_CAPACITY)
    @capacity = capacity
    @planes = []
    @weather = "sunny"
  end

  def dock(plane)
    raise "Can't dock a flying plane" if plane.flying?
    raise "Can't dock plane twice" if planes.include?(plane)
    update_weather
    @planes << plane
  end

  def undock(plane)
    raise "Can't undock a plane that is not here" if plane.flying?
    planes.delete(plane)
  end

  def full?
    planes.length == capacity
  end

  def update_weather
    return @weather = "stormy" if Random.rand > 0.9
    @weather = "sunny"
  end

  private
  attr_writer :weather, :planes

end
