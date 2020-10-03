require_relative 'plane'
require_relative 'weather'

class Airport
  include Weather
  DEFAULT_CAPACITY = 20
  attr_reader :capacity

  def initialize(capacity = DEFAULT_CAPACITY)
    @capacity = capacity
    @planes = []
  end

  def land(plane)
    raise "This airport is full." if @planes.size >= @capacity

    raise "Stormy weather, landing not possible." if weather? >= 7
    @planes << plane
  end

  def take_off
    raise "Stormy weather, take-off not possible." if weather? >= 7

    @planes[-1].flying
    @planes.pop
  end
end
