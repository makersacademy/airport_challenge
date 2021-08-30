require_relative 'plane'
require_relative 'weather'

class Airport
  attr_reader :plane, :capacity
  
  DEFAULT_CAPACITY = 10

  def initialize(capacity=DEFAULT_CAPACITY)
    @planes = []
    @capacity = capacity
  end

  def lands(plane)
    weather = Weather.new
    weather = weather.generates
    fail 'Stormy - do not land!' if weather == :stormy
    fail 'Airport full - do not land!' if @planes.count >= @capacity
    @planes << plane
  end
  
  def takesoff
    weather = Weather.new
    weather = weather.generates
    fail 'Stormy - do not takeoff!' if weather == :stormy
    fail 'No planes available' if @planes.empty?
    @planes.pop
  end
end