require_relative 'weather'

class Airport
  DEFAULT_CAPACITY = 20

  def initialize(weather, capacity = DEFAULT_CAPACITY)
    @weather = weather
    @capacity = capacity
    @planes = []

  end

  def instruct_landing(plane)
    raise 'Plane cannot land. Airport is full' if full?
    raise 'Plane cannot land due to stormy weather' if stormy?
    plane.instruct_landing(self)
    @planes << plane
  end

  def instruct_take_off(plane)
    raise 'Plane cannot take off due to stormy weather' if stormy?
    raise 'Plane cannot take off. Plane at another airport' unless
    at_airport?(plane)
    plane.instruct_take_off
    plane
  end

  private

  def full?
    @planes.size >= @capacity
  end

  def stormy?
    @weather.stormy?
  end

  def at_airport?(plane)
    @planes.include?(plane)
  end
end
