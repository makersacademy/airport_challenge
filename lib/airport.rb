require_relative 'plane'

class Airport
  attr_reader :planes
  def initialize
    @planes = []
  end

  def land(plane)
    fail "The airport is full" if full?
    @plane = plane
    @planes << @plane
  end

  def take_off
    @planes.pop
  end

  private
  def full?
    @planes.count >= 50
  end
end