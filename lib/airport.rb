require_relative 'plane'
require_relative 'weather'

class Airport

  DEFAULT_CAPACITY = 5

  attr_reader :capacity

  def initialize(capacity = DEFAULT_CAPACITY, weather = Weather.new)
    @planes = []
    @weather = weather
    @capacity = capacity
  end

  def land(plane)
    clear_to_land?(plane)
    planes << plane
    plane.land
  end

  def clear_to_land?(plane)
    raise 'Airport is at full capacity' if full?

    raise "Plane has already landed somewhere else" if plane.landed

    raise 'Weather is too bad' if stormy?
  end

  def full?
    planes.length >= capacity
  end

  def take_off(plane)
    clear_to_take_off?(plane)
    planes.delete(plane)
    plane.take_off
  end

  def clear_to_take_off?(plane)
    raise 'Weather is too bad' if stormy?

    raise "this plane isn't at the airport" unless planes.include?(plane)
  end

  private

  attr :weather, :planes

end
