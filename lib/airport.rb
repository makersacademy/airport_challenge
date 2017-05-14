require_relative 'plane'
require_relative 'weather'

class Airport
  
  DEFAULT_CAPACITY = 20
  attr_reader :planes
  attr_accessor :capacity, :sunny

  def initialize capacity = DEFAULT_CAPACITY
    @planes = []
    @capacity = capacity
    condition = Weather.new
    @weather = condition.sunny
  end

  def take_off plane
    fail 'No planes at the airport' if empty?
    fail 'Weather stormy! Cannot take off!' unless sunny
    @planes.pop
  end
 

  def land plane
    fail 'Airport full!' if full?
    fail 'Weather Stormy cannot land' unless sunny
    fail 'Plane already landed!' if plane.landed
    plane.landed = true
    planes << plane
  end

  private

  def full?
    @planes.count >= capacity
  end

  def empty?
    @planes.empty?
  end

end


# airport = Airport.new
# plane = Plane.new
# airport.sunny = true
# airport.land(plane)
# airport.land(plane)

