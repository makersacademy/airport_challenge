require_relative 'plane'

class Airport
  attr_accessor :plane, :capacity
  DEFAULT_CAPACITY= 30

  def initialize(capacity= DEFAULT_CAPACITY)
    @plane= []
    @capacity= capacity
  end

  def landing(plane)
    fail "sorry, the airport is FULL" if @plane.size >= DEFAULT_CAPACITY
    if plane.permission?
      @plane << plane
    else
      "no permission to land!"
    end
  end

  def taking_off(plane)
    @planes.pop.permission?
  end

end