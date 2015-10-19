require './lib/weather.rb'
require './lib/plane.rb'
class Airport

  include Weather

  attr_reader :capacity, :planes
  DEFAULT_CAPACITY = 5

  def initialize (capacity = DEFAULT_CAPACITY)
    @capacity = capacity
    @planes = []
  end

  def land(plane)
    raise 'This airport is full' if full?
    raise 'It is too stormy to land' if stormy?
    raise 'This plane has already landed' if plane.flying == false
    planes << plane
  end

  def release(plane)
    raise 'It is too stormy to fly' if stormy?
    raise 'This plane is already flying' if plane.flying == true
    planes.delete(plane)
  end

  private

  def full?
    planes.length >= capacity
  end

end
