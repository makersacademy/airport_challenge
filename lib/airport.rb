require_relative 'plane.rb'

class Airport
  DEFAULT_CAPACITY = 5
  def initialize(capacity = DEFAULT_CAPACITY)
    @hangar = []
    @capacity = capacity
  end

  attr_reader :hangar, :weather, :capacity

  def land(plane)
    raise 'Cannot land planes that are not in flight' unless in_flight?(plane)
    raise 'Cannot land. Weather is stormy.' if stormy?
    raise 'Hangar full.' if hangar_full?

    plane.lands
    store(plane)
  end

  def take_off(plane)
    preflight_checks(plane)
    taxi(plane)
    plane.takes_off
    plane
  end
  
  def stormy?
    rand > 0.8
  end

  private

  def preflight_checks(plane)
    raise 'Cannot take off planes that are already in flight' if in_flight?(plane)
    raise 'Cannot take off. Weather is stormy.' if stormy?
    raise 'This plane is not in the hangar.' unless in_hangar?(plane)
  end

  def in_flight?(plane)
    plane.flying?
  end

  def hangar_full?
    @hangar.size == @capacity
  end

  def store(plane)
    @hangar << plane
    plane
  end

  def taxi(plane)
    @hangar.delete(plane)
  end

  def in_hangar?(plane)
    @hangar.include?(plane)
  end
end
