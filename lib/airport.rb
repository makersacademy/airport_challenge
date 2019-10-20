require_relative 'plane'
require_relative 'weather'

class Airport

  attr_accessor :planes

  DEFAULT_CAPACITY = 50

  def initialize(capacity = DEFAULT_CAPACITY)
    @planes = []
    @capacity = capacity
    @weather = Weather.new
  end

  def land(plane)
    raise "That plane has already landed" if has_landed?(plane)
    raise "Too stormy to land" if stormy?
    raise "Airport is full" if full?

    plane.plane_landed
    @planes << plane
  end

  def take_off(plane)
    raise "Too stormy for take off" if stormy?
    raise "No plane in airport, cannot take off" unless in_airport?(plane)

    plane.plane_flying
    @planes.delete(plane)
  end

  def full?
    @planes.length >= @capacity
  end

  def stormy?
    @weather.forecast == "Stormy"
  end

  def has_landed?(plane)
    plane.landed?
  end

  def in_airport?(plane)
    @planes.include? plane
  end
end
