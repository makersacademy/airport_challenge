require_relative 'plane'

class Airport
  DEFAULT_CAPACITY = 20

  attr_reader = :planes

  def initialize
    @planes = []
    #@capacity = DEFAULT_CAPACITY
  end

  def request_landing(plane)
    # fail 'Bad weather' if stormy?
    # fail 'Airport full' if full?
    @planes << plane
    plane.land
  end

  def request_take_off(plane)
    plane.take_off
  end


  #private

  def full?
    'full'
  end
end
