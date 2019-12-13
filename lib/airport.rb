require_relative 'plane'

class Airport
  attr_reader :hanger

  DEFAULT_CAPACITY = 10

  def initialize(capacity = DEFAULT_CAPACITY)
    @hanger = []
    @capacity = capacity
  end

  def land_plane(plane)
    raise "Landing rejected, over capacity" if full?
    @hanger.push(plane)
    true
  end

  def take_off(plane)
    @hanger.delete(plane)
    true
  end

  private

  def full?
    @hanger.count >= @capacity
  end

end
