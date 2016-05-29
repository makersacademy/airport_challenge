require_relative 'plane'

class Airport

  DEFAULT_CAPACITY = 20

  attr_reader :planes
  attr_reader :capacity

  def initialize(capacity = DEFAULT_CAPACITY)
    @planes = []
    @capacity = capacity
  end

  def land_plane(plane)
    raise 'This plane has already taken off!' if plane.landed?
    raise 'The airport is full!' if full?
    @planes << plane
  end

  def take_off_plane(plane)
    raise 'The airport is empty!' if @planes == []
    @planes.pop
    @planes
  end

  def full?
    @planes.size >= DEFAULT_CAPACITY
  end
  private :full?
end
