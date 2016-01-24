require_relative 'plane'

class Airport
  attr_reader :capacity
  #attr_accessor :capacity

  DEFAULT_CAPACITY = 50
  STORM_PERCENTAGE = 15

  def initialize(capacity=DEFAULT_CAPACITY)
    @capacity = capacity
    @planes = []
  end

  def land(plane)
    fail 'Landing is not allowed in stormy weather' if stormy?
    fail 'Landing is not permitted as airport is full' if full?
    fail 'Only planes can land' unless plane.kind_of?(Plane)
    plane.to_land(self)
    planes << plane
    plane.confirm('landed', self)
  end

  def take_off(specific_plane)
    fail 'Take-off is not allowed in stormy weather' if stormy?
    fail 'Plane not at airport' unless contains?(specific_plane)
    specific_plane.take_off(self)
    planes.select!{|plane| plane != specific_plane}
    specific_plane.confirm('took-off',self)
  end

  def contains?(specific_plane)
    planes.include?(specific_plane)
  end

  def stormy?
    true if rand(1..100) <= STORM_PERCENTAGE
  end

  def change_capacity(new_capacity)
    fail 'Number of planes is higher than new capacity' if new_capacity < planes.length
    @capacity = new_capacity
  end

  private

  attr_reader :planes

  def full?
    planes.length >= capacity
  end


end
