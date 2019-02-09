require_relative 'plane.rb'
require_relative 'weather.rb'
class Airport
  attr_reader :planes
  DEFAULT_CAPACITY = 20
  def initialize(capacity = DEFAULT_CAPACITY)
    @planes = []
    @capacity = capacity
  end

  def weathergood?
    weather = Weather.new
    weather.state
  end

  def full?
    @planes.length == @capacity ? true : false
  end

  def land_plane(plane)
    raise "The airport is full" if full?
    raise "Weather does not allow landing" unless weathergood?

    @planes << plane
  end

  def take_off(plane)
    @planes.pop
  end

end
