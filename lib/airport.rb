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

    @hanger << plane
  end

  def takeoff(plane)
    @hanger.delete(plane)
  end

  def change_capacity(new)
    @capacity = new
  end

  private
  def full?
    @hanger.size >= @capacity
  end
end
