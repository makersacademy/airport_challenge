require_relative 'plane'
require_relative 'weather'

class Airport

  DEFAULT_CAPACITY = 10
  attr_reader :planes

  def initialize
    @capacity = DEFAULT_CAPACITY
    @planes = []
  end

  def land(plane)
    fail 'Landing not possible, airport full.' if planes.length >= @capacity
    fail 'Landing and take-off not possible, too stormy.' if stormy?
    planes <<  plane
  end

  def take_off
    fail 'Landing and take-off not possible, too stormy.' if stormy?
    planes.pop
  end

  def set_capacity(number)
    @capacity = number
  end

  private

  def stormy?


  end

end
