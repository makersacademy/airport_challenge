require_relative 'weather'

class Airport

  include Weather

  DEFAULT_CAPACITY = 20

  attr_reader :capacity, :planes

  def initialize(capacity = DEFAULT_CAPACITY)
    @planes = []
    @capacity = capacity
  end

  def plane_land(plane)
    planes << plane
  end

  def plane_take_off(plane)
    planes.delete(plane)
  end

  def full?
    planes.size >= capacity
  end

  def empty?
    planes.empty?
  end

end
