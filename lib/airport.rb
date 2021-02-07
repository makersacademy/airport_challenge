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

    @planes << plane
    @planes
  end

  def take_off(plane)
    if @planes.include? plane
      index = @planes.find_index(plane)
      @planes.delete_at(index)
    else
      fail 'Plane not in current airport'
    end
  end
  
  private

  attr_reader :planes

  def full?
    planes.count >= @capacity
  end
end
