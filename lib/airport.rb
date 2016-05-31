require_relative 'plane'

class Airport
  attr_accessor :plane, :capacity
  DEFAULT_CAPACITY= 30

  def initialize(capacity= DEFAULT_CAPACITY)
    @planes= []
    @capacity= capacity
  end

  def landing(plane)
    fail "sorry, the airport is FULL" if @planes.size >= DEFAULT_CAPACITY
    if plane.permission?
      @planes << plane
    else
      "no permission to land!"
    end
  end

  def taking_off(weather)
    fail "there are no planes" if @planes.empty?
    fail "bad weather no permission to take off" if weather == false
    @planes.pop.permission?
  end

end