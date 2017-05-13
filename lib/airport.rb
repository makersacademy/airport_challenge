require_relative 'plane'

class Airport

  attr_accessor :capacity
  DEFAULT_CAPACITY = 10

  def initialize(capacity = DEFAULT_CAPACITY)
    @capacity = capacity
  end

  def try_allow_landing(plane)

  end

  def try_allow_take_off(plane)

  end

end
