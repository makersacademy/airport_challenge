require_relative 'plane.rb'

class Airport
  DEFAULT_CAPACITY = 5
  def initialize(capacity = DEFAULT_CAPACITY)
    @hangar = []
    @capacity = capacity
  end

  attr_reader :hangar, :weather, :capacity

  def land(plane)
    raise 'Cannot land planes that are not in flight' unless plane.flying?
    raise 'Cannot land. Weather is stormy.' if stormy?
    raise 'Hangar full.' if @hangar.size == @capacity

    plane.lands
    @hangar << plane
    plane
  end

  def take_off(plane)
    raise 'Cannot take off planes that are already in flight' if plane.flying?
    raise 'Cannot take off. Weather is stormy.' if stormy?

    @hangar.delete(plane)
    plane.takes_off
    plane
  end

  def stormy?
    rand > 0.8
  end
end
