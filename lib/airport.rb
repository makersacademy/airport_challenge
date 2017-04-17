require_relative 'plane'
require_relative 'weather'

class Airport
  attr_reader :capacity, :weather

  DEFAULT_CAPACITY = 50

  def initialize(capacity=DEFAULT_CAPACITY)
    @capacity = capacity
    @planes = []
    @weather = Weather.new
  end

  def land(plane) #add symbols
    fail 'Landing is not allowed in stormy weather' if weather.stormy?
    fail 'Landing is not permitted as airport is full' if full?
    fail 'Only planes can land' unless plane.is_a?(Plane)
    plane.to_land(self)
    planes << plane
    plane.confirm(:landed, self)
  end

  def take_off(specific_plane)
    fail 'Take-off is not allowed in stormy weather' if weather.stormy?
    fail 'Plane not at airport' unless contains?(specific_plane)
    specific_plane.take_off(self)
    planes.delete(specific_plane)
    specific_plane.confirm(:took_off, self)
  end

  def contains?(specific_plane)
    planes.include?(specific_plane)
  end

  def change_capacity(new_capacity)
    msg = 'Number of planes is higher than new capacity'
    fail msg if new_capacity < planes.length
    @capacity = new_capacity
  end

  private

  attr_reader :planes

  def full?
    planes.length >= capacity
  end


end
