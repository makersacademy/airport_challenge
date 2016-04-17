require 'pry'

class Airport

  DEFAULT_CAPACITY = 10

  def initialize(capacity = DEFAULT_CAPACITY)
    @planes = []
    @capacity = capacity
  end

  def store(plane)
    fail "The airport is full" if planes.length >= capacity
    @planes << plane
  end

  private
    attr_reader :planes, :capacity

end