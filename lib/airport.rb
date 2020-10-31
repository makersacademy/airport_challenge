require_relative './plane.rb'
require_relative './weather.rb'

class Airport
  attr_reader :planes, :capacity

  DEFAULT_CAPACITY = 50

  def initialize(capacity = DEFAULT_CAPACITY)
    @capacity = capacity
    @planes = []
  end

  def land(plane, weather)
    raise 'Cannot land, Airport at maximum capacity' if full?
    raise 'Weather conditions unacceptable for landing' if weather == :stormy
    @planes.push(plane)
    plane.landed = true
  end

  def take_off(weather)
    raise 'Airport empty' if @planes.empty?
    raise 'Weather conditions unacceptable for take off' if weather == :stormy
    plane = @planes.shift
    plane.landed = false
    print "#{plane} has taken off"
    plane
  end

  private

  def full?
    @planes.length == @capacity
  end
end