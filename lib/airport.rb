require_relative 'plane'
require_relative 'weather'

# a class to create Airport instances
class Airport
  DEFAULT_CAPACITY = 10

  def initialize(capacity = DEFAULT_CAPACITY)
    @planes = []
    @capacity = capacity
  end

  def land(plane, stormy = Weather.stormy?)
    raise 'That is not a plane.' unless type?(plane)
    raise 'The airport is full.' if full?
    raise 'The weather is stormy, planes cannot land.' if stormy

    add(plane)
  end

  def takeoff(plane, stormy = Weather.stormy?)
    raise 'That plane is not at this airport.' unless check?(plane)
    raise 'The weather is stormy, planes cannot take off.' if stormy

    remove(plane)
    'The plane took off.'
  end

  def check?(plane)
    @planes.include?(plane)
  end

  private

  def type?(plane)
    plane.is_a?(Plane)
  end

  def full?
    @planes.length >= @capacity
  end

  def add(plane)
    @planes.push(plane)
  end

  def remove(plane)
    @planes.delete(plane)
  end
end
