require_relative 'plane'
class Airport
  DEFAULT_CAPACITY = 33
  attr_accessor :capacity
  def initialize(capacity = DEFAULT_CAPACITY)
    @planes = []
    @capacity = capacity
  end

  def land(plane)
    fail 'Airport full' if full?

    fail 'Already in airport' if @planes.include? plane

    @planes << plane
    @planes
  end

  def take_off(plane)
    fail 'Plane not in current airport' unless @planes.include? plane

    index = @planes.find_index(plane)
    @planes.delete_at(index)
  end

  private

  attr_reader :planes

  def full?
    planes.count >= @capacity
  end
end
