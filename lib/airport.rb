require_relative "weather"

class Airport 
  
  DEFAULT = 10
  attr_reader :aircrafts, :capacity

  def initialize(capacity = DEFAULT)

    @aircrafts = []
    @capacity = capacity
    
  end

  def land(permit)
    fail "airport is full" if full?
    fail "stormy weather, no permission to land" unless permit.operable?
    @aircrafts << 1
  end

  def take_off(permit)
    fail "stormy weather, no permission to take off" unless permit.operable?
    @aircrafts.pop
  end

  def full?
    @aircrafts.count == @capacity
  end

end