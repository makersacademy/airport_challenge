require_relative "plane"

class Airport
  attr_reader :capacity

  def initialize(capacity = 1)
    @capacity = capacity
    # @planes = 0
  end

  def full?
    true
    # planes >= capacity
  end
end

# binding.pry
