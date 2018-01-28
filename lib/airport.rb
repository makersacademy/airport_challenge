require_relative 'plane'
require_relative 'weather'

class Airport 

  DEFAULT_CAPACITY = 20
  
  attr_reader :planes, :capacity, :weather

  def initialize(weather = Weather.new, capacity = DEFAULT_CAPACITY)
    @planes = []
    @weather = weather
    @capacity = capacity
  end

  def land(plane)
    raise "Plane has already landed" if @planes.include?(plane)
    raise "Plane cannot land. Airport is full" if full?
    raise "Stormy weather - can't land" if @weather.stormy?
    @planes << plane
    return "Plane has landed"
  end

  def take_off(plane)
    raise "The plane is not in this airport" unless @planes.include?(plane)
    raise "Stormy weather - can't take off" if @weather.stormy?
    @planes.delete(plane)
    return "The plane has taken off and left the airport"
  end

private

  def full?
    @planes.count >= @capacity
  end

end
