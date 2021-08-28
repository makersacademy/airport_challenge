require_relative 'plane'

class Airport
  DEFAULT_CAPACITY = 10
  attr_reader :hangar, :capacity

  def initialize(capacity = DEFAULT_CAPACITY)
    @hangar = []
    @capacity = capacity
  end

  def dock_landing_plane(plane)
    fail 'Hangar is full' if full?
    @hangar << plane
  end

  def release_for_takeoff
    fail 'No planes in hangar' if empty?
    @hangar.pop
  end

  private

  def full?
    @hangar.count >= capacity
  end

  def empty?
    @hangar.empty?
  end
end
