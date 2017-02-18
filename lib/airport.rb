require_relative 'plane'

class Airport

  DEFAULT_CAPACITY=10
  attr_reader :planes, :capacity

  def initialize(capacity = DEFAULT_CAPACITY)
    @planes = []
    @capacity = capacity
  end

  def land_plane(plane)
    raise "This airport is full, you cannot land here." if full?
    @planes.push(plane)
    "The plane has landed safely"
  end

  def take_off
    raise "There are no planes to take off!" if empty?
    @planes.pop
    "The plane has taken off safely"
  end

  private

  def empty?
    @planes.length == 0
  end

  def full?
    @planes.length >= capacity
  end

end
