require 'plane'

class Airport
  attr_reader :capacity

  def initialize(capacity = 10)
    @capacity = capacity
  end

  def change_capacity(capacity)
    @capacity = capacity
  end
end
