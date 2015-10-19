require './lib/weather.rb'
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
    planes << plane
  end

  def release(plane)
    raise 'It is too stormy to fly' if conditions :stormy
    planes.pop
  end

  private

  def full?
    planes.length >= capacity
  end

end
