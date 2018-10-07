require_relative 'weather'
require_relative 'plane'
require 'pry'

class Airport
  def initialize
    @planes = []
  end

  def planes_count
    @planes.count
  end

  def land(weather)
    plane = Plane.new
    fail "The airport is full" if planes_count > 1
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
