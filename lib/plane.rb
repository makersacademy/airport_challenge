require_relative 'weather'
require 'pry'

class Plane
  def initialize
  end

  def land(weather)
    fail "The weather is stormy" if weather == "stormy"
    "The plane has landed"
  end

  def take_off(weather)
    fail "The weather is stormy" if weather == "stormy"
    "The plane has taken off"
  end
end
