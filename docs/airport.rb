require_relative 'plane'
require_relative 'weather'

class Airport
  DEFAULT_CAPACITY = 5
  attr_reader :planes, :capacity

  def initialize(capacity = DEFAULT_CAPACITY)
    @planes = []
    @capacity = capacity
  end

  def land(plane)
    fail 'Weather is stormy, cannot land' if Weather.stormy?

    fail 'Airport is full!' if full?

    @planes << plane
    
  end

  def take_off(plane)
    fail 'Weather is stormy, cannot take off' if Weather.stormy?

    @planes.delete(plane)
  end

  def confirm_take_off(plane)
    fail 'Plane has not taken off.' unless flying?(plane)

    return 'Plane has taken off.'
  end

  def flying?(plane)
    !@planes.include? plane
  end

  private
  
  def full?
    @planes.count == @capacity
  end

end
