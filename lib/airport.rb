require_relative './plane.rb'
require_relative './weather.rb'
include Weather

class Airport
  attr_reader :planes, :capacity

  DEFAULT_CAPACITY = 50

  def initialize(capacity = DEFAULT_CAPACITY)
    @capacity = capacity
    @planes = []
  end

  def land(plane)
    raise 'Cannot land, Airport at maximum capacity' if full?
    raise 'Weather conditions unacceptable for landing' if stormy?
    @planes.push(plane)
    plane.landed
  end

  def take_off
    raise 'Airport empty' if @planes.empty?
    raise 'Weather conditions unacceptable for take off' if stormy?
    plane = @planes.shift
    plane.flying
    print "#{plane} has taken off"
    plane
  end

  private

  def stormy?
    Weather.current == :stormy
  end

  def full?
    @planes.length == @capacity
  end
end