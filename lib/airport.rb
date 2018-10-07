require_relative 'weather'
require_relative 'plane'
require 'pry'

class Airport
  DEFAULT_CAPACITY = 20
  attr_reader :capacity

  def initialize(capacity = DEFAULT_CAPACITY)
    @planes = []
    @capacity = capacity
  end

  def planes_count #Do I need this?
    @planes.count
  end

  def land(weather)
    plane = Plane.new
    fail "The airport is full" if planes_count > (DEFAULT_CAPACITY - 1)
    fail "The weather is stormy" if weather == "stormy"
    @planes << plane
    "The plane has landed"
  end

  def take_off(weather)
    fail "The weather is stormy" if weather == "stormy"
    @planes.pop
    "The plane has taken off"
  end
end
