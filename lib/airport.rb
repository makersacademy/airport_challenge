require './lib/weather'

class Airport
  attr_reader :capacity

  DEFAULT_CAPACITY = 22

  def initialize
    @planes = []
    @capacity = DEFAULT_CAPACITY
  end

  def land(plane)
    raise('Airport full!') if full?

    raise('Too stormy!') if stormy?

    raise('Plane already here!') if hangar?(plane)

    @planes.push(plane)
  end

  def take_off(plane)
    raise('Too stormy!') if stormy?

    raise('Plane not here!') unless hangar?(plane)

    @planes.delete(plane)
  end

  def hangar?(plane)
    @planes.include?(plane)
  end

  def change_capacity(capacity)
    @capacity = capacity
  end

  private

  def full?
    @planes.length >= @capacity
  end

  def stormy?
    Weather.stormy?
  end
end
