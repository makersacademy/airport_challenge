require_relative './plane'
require_relative './weather'

class Airport
  attr_accessor :capacity
  attr_reader :planes

  DEFAULT_CAPACITY = 10

  def intialize(capacity = DEFAULT_CAPACITY)
    @capacity = capacity
    @planes = []
  end

  def land(plane)
    fail 'Airport is full' if full?
    @planes << plane
  end

  def take_off(plane)
    fail 'No planes available' if empty?

    @planes.delete(plane)
  end

  private

  attr_reader :bike

  def empty?
    @planes.empty?
  end

  def full?
    @planes.count >= @capacity
  end
end
