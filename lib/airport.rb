require_relative 'plane'
class Airport
  DEFAULT_CAPACITY = 20
  def initialize
    @planes = []
    @capacity = DEFAULT_CAPACITY
  end

  attr_reader :plane, :capacity

  def landing_plane
  end

  def airport_capacity(plane)
    fail 'Airport is full' if full?

    @planes << plane
  end

  def land(plane)
    fail 'Stormy weather, do not land!' unless @plane

    @plane = plane
  end

  def take_off
    fail 'Stormy weather, do not take off!' if empty?

    @planes.pop
  end

  private

  def full?
    @planes.count >= DEFAULT_CAPACITY
  end

  def empty?
    @planes.empty?
  end
end
