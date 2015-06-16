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
    fail 'Too stormy to fly.' if stormy?
    plane = planes.pop
    plane.take_off
  end
  
  def stormy?
    true if rand > 0.9
  end

  private

  def full?
    planes.count >= capacity
  end

end
