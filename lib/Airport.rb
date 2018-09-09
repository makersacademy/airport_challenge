require_relative 'plane.rb'
require_relative 'weather.rb'

class Airport

  attr_reader :capacity, :hangar

  include Weather

  def initialize
    @hangar = []
  end

  def take_off(plane)
    fail "It's stormy, no taking off" if weather == "stormy"
    hangar.pop
    plane.take_off
  end

  def land(plane)
    fail "That plane is already in the hangar" if hangar.include?(plane)
    fail "Hangar full, no landing" if full?
    fail "It's stormy, no landing" if weather == "stormy"
    hangar << plane
    plane.land
  end
end
