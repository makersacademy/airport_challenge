require_relative 'plane'
require_relative 'weather'

class Airport
  attr_reader :stationed_planes, :weather
  attr_accessor :capacity

  def initialize
    @stationed_planes = []
    @capacity = 1
    @weather = Weather.new
  end

  def land(plane)
    raise "Airport full" if full?
    @stationed_planes << plane
  end

  def take_off
    @stationed_planes.pop
  end

  private
  def full?
    @stationed_planes.length >= @capacity
  end
end
