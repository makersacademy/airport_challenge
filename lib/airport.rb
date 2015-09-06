require_relative "plane"

class Airport
attr_accessor :capacity, :hangar

DEFAULT_CAPACITY = 20

  def initialize(capacity = DEFAULT_CAPACITY)
    @capacity = capacity
    @hangar = []
  end
end
