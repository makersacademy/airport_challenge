require_relative 'plane'
require_relative 'weather'

class Airport

  DEFAULT_CAPACITY = 30
  attr_reader :planes
  attr_reader :capacity
  attr_reader :weather

  def initialize(capacity = DEFAULT_CAPACITY)
    @capacity = capacity
    @planes = []
    @weather = []

  end

  def land(plane)
  	fail 'Airport Full' if full?
    fail 'Weather is stormy' if stormy?
    @planes << plane

  end

  def take_off
  	fail 'No planes available' if @planes.count == 0
    fail 'Weather is stormy' if stormy?
    plane = @planes.pop
    puts "#{plane} has left the Airport!"
    plane
  end

  private

  def full?
  	@planes.count >= capacity
  end

  def stormy?
    @weather == "stormy"
  end 

end