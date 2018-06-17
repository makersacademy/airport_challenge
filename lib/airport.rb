require_relative './plane.rb'

class Airport
  DEFAULT_CAPACITY = 10

  attr_accessor :weather
  attr_reader :capacity
  attr_reader :planes

  def initialize(capacity = DEFAULT_CAPACITY)
    rand(10) < 8 ? @weather = 'clear' : @weather = 'stormy'
    @capacity = capacity
    @planes = []
  end

  def land(plane)
    raise 'Cannot land due to stormy weather.' if stormy?
    raise 'Cannot land: Airport at capacity.' if full?
    puts 'Plane landed successfully.'
    plane.at_airport = true
    @planes << plane
  end

  def takeoff(plane)
    raise 'Cannot take off due to stormy weather.' if stormy?
    puts 'Plane took off successfully.'
    plane.at_airport = false
    @planes.delete(plane)
  end

  def stormy?
    @weather == 'stormy'
  end

  def full?
    planes.size >= capacity
  end
end
