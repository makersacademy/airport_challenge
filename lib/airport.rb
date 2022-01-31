require_relative 'plane'

class Airport

  DEFAULT_CAPACITY = 10

  attr_accessor :capacity

  def initialize(capacity = DEFAULT_CAPACITY)
    @planes = []
    @capacity = DEFAULT_CAPACITY
  end

  def take_off
    fail 'No planes available to take-off' if empty?
    fail 'Cannot take off, weather is stormy' if stormy?
    @planes.pop
  end

  def land(plane)
    fail 'The airport is full' if full?
    @planes << plane
  end

  private

  attr_reader :planes

  def full?
    @planes.count >= capacity
  end

  def empty?
    @planes.empty?
  end

  def check_weather
    @stormy = true 
  end
  
  def stormy?
    @stormy
  end

end
