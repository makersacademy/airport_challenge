require "plane"

class Airport
attr_accessor :capacity
DEFAULT_CAPACITY = 20
  def initialize(capacity = DEFAULT_CAPACITY)
    @capacity = capacity
  end
end
