require_relative 'plane'

class Airport

  DEFAULT_CAPACITY = 100

  attr_accessor :capacity
  attr_reader :planes

  def initialize
    @capacity = DEFAULT_CAPACITY
    @planes = []
  end

  def landing plane
    plane.grounded?
    fail 'The airport is full!' if full?
    planes << plane
  end

  def release_plane
    planes.pop
  end

  private

  def full?
    planes.count >= capacity
  end

end
