require_relative 'plane'

class Airport

  DEFAULT_CAPACITY = 20

  attr_reader :planes, :capacity

  def initialize(capacity = DEFAULT_CAPACITY)
    @planes = []
    @capacity = capacity
  end

  def land_plane(plane)
    fail 'This plane has already landed!' if plane.landed?
    fail 'The airport is full!' if full?
    @planes << plane
    return 'The plane has landed!'
  end

  def take_off_plane(plane)
    fail 'This plane has already taken off!' unless plane.landed?
    fail 'The airport is empty!' if empty?
    @planes.pop
    @planes
    return 'The plane has taken off!'
  end

  def full?
    @planes.size >= DEFAULT_CAPACITY
  end

  def empty?
    @planes.size <= 0
  end
  private :full?, :empty?
end
