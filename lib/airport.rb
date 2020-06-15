require_relative('plane')
require_relative('weather')

class Airport
  attr_accessor :planes, :capacity, :safe_to_fly
    DEFAULT_CAPACITY = 20

  def initialize(capacity = DEFAULT_CAPACITY)
    @planes = []
    @capacity = capacity
    @safe_to_fly = [true, false].sample
  end

  def land(plane)
    fail "It's not safe to take off" unless safe_to_fly == true
    fail "The airport is full" unless full == false
    @planes << plane
    "The plane has landed"
  end

  def takeoff(plane)
    fail "It's not safe to take off" unless safe_to_fly == true
    fail "There are no planes" unless empty == false
    @planes.delete(plane)
    "The plane has taken off"

  end

  private
   
  def full
    @planes.count >= @capacity
  end

  def empty
    @planes == []
  end

end