require_relative "plane"

class Airport

  attr_reader :capacity

  def initialize(capacity = 10)
    @capacity = capacity
  end
end
