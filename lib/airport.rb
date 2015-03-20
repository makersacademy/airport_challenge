require_relative 'plane'

class Airport
  DEFAULT_CAPACITY = 10

  attr_reader :planes

  def initialize
    @planes = []
  end

  def land plane
    fail 'Airport is Full' if full?
    @planes << plane
  end

  def take_off
    @planes.pop
  end

  def plane_check
    @planes
  end

  private

  def plane_count
    @planes.length
  end

  def full?
    plane_count >= DEFAULT_CAPACITY
  end
end
