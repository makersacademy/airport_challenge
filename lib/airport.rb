require_relative "plane"

class Airport
  attr_accessor :capacity
  DEFAULT_CAPACITY = 500

  def initialize(capacity=DEFAULT_CAPACITY)
    @capacity = capacity
  end

  def airport_capacity(capacity)
    @capacity
  end
end
