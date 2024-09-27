require_relative 'plane'

class Airport
  DEFAULT_CAPACITY = 10
  attr_reader :capacity

  def initialize(capacity = DEFAULT_CAPACITY)
    @hangar = []
    @capacity = capacity
  end

  def dock_landed_plane(plane)
    raise 'Plane is flying and cannot be docked' unless plane.landed
    
    raise 'Hangar is full' if full?

    hangar << plane
  end

  def release_for_takeoff
    raise 'No planes in hangar' if empty?

    hangar.pop
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
