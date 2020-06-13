require_relative('plane')
require_relative('weather')

class Airport
  attr_accessor :planes, :capacity, :safe_to_fly

  def initialize(capacity = 1)
    @planes = []
    @capacity = capacity
    @safe_to_fly = [true, false].sample
  end

  def land(plane)
    @safe_to_fly ? (full ? "The airport is full" : @planes << plane && "The plane has landed") : "It's not safe to land"
  end

  def takeoff(_plane)
    @safe_to_fly ? (not_empty ? "The plane has taken off" : "There are no planes") : "It's not safe to take off"
    # @planes.pop
  end
   
  def full
    @planes.count >= @capacity
  end

  def not_empty
    @planes != []
  end

end