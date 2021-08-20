require_relative 'plane'
require_relative 'weather'

class Airport
  attr_reader :planes, :capacity, :weather
  DEFAULT_CAPACITY = 4

  def initialize(capacity = DEFAULT_CAPACITY, weather = Weather.new)
    @capacity = capacity
    @planes = []
    @weather = weather
  end

  def land(plane)
    fail "Landing is not permmited- the airport is full" if full?
    fail "Landing is not permmited- stormy weather!" if weather.stormy?
   
    planes << plane
  end

  def take_off(plane)
    fail "Take off is not permmited- stormy weather!" if weather.stormy?
    fail "Cannot take off- the plane is at another airport" unless planes.include?(plane)

    planes.delete(plane)
    puts "The plane took off and is no longer in the airport"
  end

  private

  def full?
    planes.length >= capacity
  end

end
