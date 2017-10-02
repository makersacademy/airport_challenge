require 'weather'

class Airport
  attr_reader :capacity
  attr_accessor :weather

  DEFAULT_CAPACITY = 10

  def initialize(name, capacity = DEFAULT_CAPACITY)
    @name = name
    @planes = []
    @capacity = capacity
  end

  def land_plane(plane)
    raise 'unable to land due to weather' if @weather == :stormy
    raise 'no space to land' if full?
    @planes << plane
  end

  def takeoff_plane
    raise 'unable to takeoff due to weather' if @weather == :stormy
    @planes.pop
  end

  def weather
    # this will trigger random weather at each call
    @weather = Weather.new
  end

  def full?
    @planes.count >= @capacity
  end

  def empty?
    @planes.empty?
  end
end
