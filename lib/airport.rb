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
    fail 'The airport is full!' if full?
    plane.land
    planes << plane
  end

  def release_plane
    plane = planes.pop
    # plane.take_off
  end

  private

  def full?
    planes.count >= capacity
  end

end
