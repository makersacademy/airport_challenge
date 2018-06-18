require_relative './plane.rb'

class Airport
  DEFAULT_CAPACITY = 10

  def initialize(capacity = DEFAULT_CAPACITY)
    rand(10) < 8 ? @weather = 'clear' : @weather = 'stormy'
    @capacity = capacity
    @planes = []
  end

  def land(plane)
    raise 'Cannot land due to stormy weather.' if stormy?
    raise 'Cannot land: Airport at capacity.' if full?
    raise 'Cannot land: already at airport.' if plane.at_airport == true
    puts 'Plane landed successfully.'
    plane.at_airport = true
    @planes << plane
  end

  def takeoff(plane)
    raise 'Cannot take off due to stormy weather.' if stormy?
    raise 'Cannot take off: not at airport.' unless planes.include?(plane)
    puts 'Plane took off successfully.'
    plane.at_airport = false
    planes.delete(plane)
  end

private
  attr_reader :weather
  attr_reader :capacity
  attr_reader :planes

  def stormy?
    @weather == 'stormy'
  end

  def full?
    planes.size >= capacity
  end
end
