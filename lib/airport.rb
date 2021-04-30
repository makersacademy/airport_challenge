require 'weather'

class Airport
  def initialize(capacity, weather)
    @capacity = capacity
    @weather = weather
    @planes = []
  end

  def land(plane)
    raise "Plane cannot land at a full airport!" if full?
    raise "Plane cannot land during stormy conditions!" if stormy?

    @planes << plane
  end

  def take_off(_plane)
    raise "Plane cannot take off during stormy conditions!" if stormy?
  end

private

  def full?
    @planes.length >= @capacity
  end

  def stormy?
    @weather.stormy?
  end

end
