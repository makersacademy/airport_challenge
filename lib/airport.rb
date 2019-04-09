require_relative 'plane'
require_relative 'weather'

class Airport

  attr_accessor :planes
  
  DEFAULT_CAPACITY = 10

  def initialize(capacity = DEFAULT_CAPACITY)
    @planes = []
    @capacity = capacity
    @weather = Weather.new
  end

  def land(plane)
    raise "That plane has already landed" if already_landed?(plane)
    raise "It is too stormy to land" if stormy?
    raise "Airport full" if full?

    plane.plane_landed
    @planes << plane
  end

  def take_off(plane)
    raise "It is too stormy to take off" if stormy?
    raise "This plane is not here" unless in_airport?(plane)

    plane.plane_flying
    @planes.delete(plane)
  end

  def full?
    @planes.length >= @capacity
  end

  def stormy?
    @weather.forecast == "Stormy"
  end

  def already_landed?(plane)
    plane.landed?
  end

  def in_airport?(plane)
    @planes.include? plane
  end
end
