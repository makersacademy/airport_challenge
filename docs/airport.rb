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
    fail 'Plane is already landed' unless plane.flying?

    fail 'Airport is full!' if full?

    fail 'Weather is stormy, cannot land' if Weather.stormy?

    @planes << plane
    plane.land
  end

  def take_off(plane)
    fail 'Plane is flying, cannot take off' if plane.flying?

    fail 'Weather is stormy, cannot take off' if Weather.stormy?
    
    plane.take_off
    @planes.delete(plane)

  end

  def confirm_take_off(plane)
    fail 'Plane has not taken off.' if plane.landed

    return 'Plane has taken off.'
  end

  private

  def full?
    @planes.count >= @capacity
  end

end
