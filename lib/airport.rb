require_relative "plane"

class Airport
  attr_reader :hanger, :capacity
  DEFAULT_CAPACITY = 10

  def initialize(capacity = DEFAULT_CAPACITY)
    @hanger = []
    @capacity = capacity
  end

  def land(plane)
    raise "The airport is full." if full?
    raise "The weather is stormy, no planes can land." if weather == "stormy"

    @hanger << plane
  end

  def takeoff(plane)
    raise "The weather is stormy, no planes can takeoff." if weather == "stormy"

    @hanger.delete(plane)
  end

  def change_capacity(new)
    @capacity = new
  end

  private
  def full?
    @hanger.size >= @capacity
  end

  def weather
    rand(10) <= 8 ? "sunny" : "stormy" # weather is stormy 10% of the time
  end
end
