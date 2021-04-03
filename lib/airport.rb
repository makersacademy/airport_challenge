require_relative "plane"
require_relative "weather"

class Airport
  attr_reader :hanger, :capacity
  DEFAULT_CAPACITY = 10

  def initialize(capacity = DEFAULT_CAPACITY)
    @hanger = []
    @capacity = capacity
  end

  def land(plane)
    raise "The airport is full." if full?
    raise "The weather is stormy, no planes can land." if Weather.stormy?
    raise "The plane is already in the hanger. It cannot land again." if hanger.include? plane
    
    plane.land
    @hanger << plane
  end

  def takeoff(plane)
    raise "The weather is stormy, no planes can takeoff." if Weather.stormy?
    raise "The plane is not in the hanger. It cannot takeoff." unless hanger.include? plane

    @hanger.delete(plane)
  end

  def change_capacity(new)
    @capacity = new
  end

  private
  def full?
    hanger.size >= capacity
  end
end
