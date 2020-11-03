require 'plane.rb'
require 'weather.rb'

class Airport
  attr_reader :planes, :capacity, :weather

  def initialize(capacity = 3)
    @planes = []
    @capacity = capacity
    @weather = Weather.new
  end

  def land(plane)
    raise 'Unable to land due to full airport' if full?
    @planes << plane
  end

  def take_off(plane)
    raise 'Unable to take off due to stormy weather' if @weather.stormy?
    @planes.delete(plane)
  end

  def full?
    @planes.count >= @capacity
  end
end
