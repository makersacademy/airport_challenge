require_relative 'plane'
require_relative 'weather'

class Airport
  DEFAULT_CAPACITY = 5
  attr_reader :planes, :capacity, :weather
  
  def initialize(capacity=DEFAULT_CAPACITY, weather)
    @capacity = capacity
    @weather = weather
    @planes = []
  end

  def land(plane)
    fail 'Airport is full' if full?
    fail 'Weather too bad to land plane' if stormy?
    @planes << plane 
  end 

  def take_off
    fail 'Weather too bad to take off' if stormy?
    @planes.pop
  end

  private 

  def full?
    @planes.length >= @capacity
  end

  def stormy?
    @weather.stormy?
  end

end