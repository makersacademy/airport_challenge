require_relative 'plane'
require_relative 'weather'

class Airport

  DEFAULT_CAPACITY = 1

attr_reader :planes, :capacity

  def initialize(capacity=DEFAULT_CAPACITY)
      @planes = []
      @capacity = capacity
    end

  def lands_plane(plane, weather)
      raise "Cannot land at airport due to adverse weather conditions" if weather == :stormy
      raise "Airport is full, no landing" if is_full?
      plane.land
      planes << plane
    end

  def take_off(plane, weather)
      raise "Cannot take off from airport due to adverse weather conditions" if weather == :stormy
      plane.flying
      planes.pop(plane)
    end

  def is_full?
    planes.count >= capacity
  end
end
