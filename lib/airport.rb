require_relative 'plane'

class Airport
  DEFAULT_CAPACITY = 10
  attr_reader :capacity

  def initialize(capacity = DEFAULT_CAPACITY)
    @hangar = []
    @capacity = capacity
  end

  def dock_landing_plane(plane)
    raise 'Hangar is full' if full?

    raise 'Weather is stormy' if stormy?

    hangar << plane
  end

  def release_for_takeoff
    raise 'No planes in hangar' if empty?

    raise 'Weather is stormy' if stormy?

    hangar.pop
  end

  def stormy?
    rand(10) > 7
  end

  private

  attr_reader :hangar

  def full?
    hangar.count >= capacity
  end

  def empty?
    hangar.empty?
  end
end
