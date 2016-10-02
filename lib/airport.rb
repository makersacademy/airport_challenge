require_relative 'plane'

class Airport
  attr_reader :planes

  def initialize
    @planes = []
  end

  def confirm_land(plane)
    fail "Plane cannot land, it is too stormy." if stormy?
    planes << plane
    planes.last
  end

  def confirm_takeoff(plane)
    fail "There are no planes in airport." if empty?
    fail "Plane cannot take off, it is too stormy." if stormy?
    planes.shift # this removes and returns the plane object that has taken off
    planes # returns array
  end

  def stormy?
    return true if rand(0..3) == 2
  end

  def empty?
    planes.empty?
  end
end
