require 'weather'

class Airport
  MAX_CAPACITY = 100
  attr_reader :planes, :capacity

  def initialize(capacity = MAX_CAPACITY)
    @planes = []
    @capacity = capacity
  end

  def land(plane)
    landing_errors(plane)
    @planes << plane
    plane.ground
    @planes
  end

  def take_off(plane)
    take_off_errors(plane)
    @planes.delete(plane)
    plane.take_flight
    'This plane has left the airport'
  end

  def plane_in_airport?(plane)
    @planes.include?(plane)
  end

  private

  def full?
    @planes.length >= @capacity
  end

  def landing_errors(plane)
    fail 'This airport is at maximum capacity' if full?
    fail 'This plane has already landed' if plane_in_airport?(plane)
    fail 'The weather does not permit landing' if weather.stormy?
  end

  def take_off_errors(plane)
    fail 'This plane is already in flight' unless plane_in_airport?(plane)
    fail 'The weather does not permit take off' if weather.stormy?
  end

  def weather
    Weather.new
  end

end
