require_relative './plane.rb'

class Airport
  def initialize
    @planes = []
  end

  def land(plane)
    fail "plane already landed" if full?
    @planes << plane
    plane
  end

  def take_off
    fail "plane already taken off" if empty?
    @planes.pop
  end

  def full?
    @planes.length >= 1
  end

  def empty?
    @planes.length <= 0
  end
end
