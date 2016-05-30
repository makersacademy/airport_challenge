require_relative 'plane'

class Airport
  attr_accessor :plane, :capacity
  DEFAULT_CAPACITY= 1

  def initialize(capacity= DEFAULT_CAPACITY)
    @plane= []
    @capacity= capacity
  end

  def landing(plane)
    fail "sorry, the airport is FULL" if full?
    if plane.landed?
      @plane << plane
    else
      "no permission to land!"
    end
  end

  def taking_off(plane)
    idx= @plane.index(plane)
    @plane.delete_at(idx)
  end

  def status
    @plane
  end

  def full?
    @plane.size == DEFAULT_CAPACITY
  end

end