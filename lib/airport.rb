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
    raise 'Too stormy to land.' if stormy?
    raise 'The airport is full!' if full?
    plane.land
    planes << plane
  end

  def release plane
    raise 'Too stormy to fly.' if stormy?
    planes.delete plane
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
