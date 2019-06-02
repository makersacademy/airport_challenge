require_relative 'plane'

class Airport

  attr_reader :planes

  DEFAULT_CAPACITY = 5

  def initialize
    @planes = []
  end

  def land(plane)
    fail 'Airport full' if full?

    @planes << plane
  end

  def take_off
    fail 'Airport empty' if empty?

    @planes.pop
  end

  private

  def full?
    @planes.count >= DEFAULT_CAPACITY
  end

  def empty?
    @planes.empty?
  end 
end
