require './lib/weather.rb'

class Airport
  DEFUALT_CAPACITY = 20

  attr_reader :planes, :capacity

  def initialize(capacity=DEFUALT_CAPACITY, weather = Weather.new)
    @planes = []
    @capacity = capacity
    @weather = weather
  end

  def land(plane)
    raise "Airport full" if full?
    raise "Cannot land due to bad weather" if stormy?
    raise "Plane already landed" if plane_landed?(plane)
    plane.land
    @planes << plane        
  end

  def take_off(plane)
    raise "Cannot take off due to bad weather" if stormy?
    raise "Plane not in airport" unless plane_at_airport?(plane)
    @planes.delete(plane)
    plane
  end

  private

  def full?
    @planes.length >= @capacity
  end

  def stormy?
    @weather.generate > 4
  end

  def plane_at_airport?(plane)
    @planes.include?(plane)
  end

  def plane_landed?(plane)
    plane.location == "airport"
  end
end