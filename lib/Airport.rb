require_relative 'plane.rb'
require_relative 'weather.rb'

class Airport

  attr_reader :capacity, :hangar

  include Weather

  def initialize
    @hangar = []
  end

  def take_off(plane)
    fail "Storm so can't take off" if weather == "stormy"
    hangar.pop
    plane.take_off
  end

  def land(plane)
    fail "Airplane is in the hangar" if hangar.include?(plane)
    fail "Hangar full so can't land" if full?
    fail "It's stormy so can't land" if weather == "stormy"
    hangar << plane
    plane.land
  end
end
