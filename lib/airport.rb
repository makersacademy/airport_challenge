require_relative 'airplane'

class Airport
  DEFAULT_VALUE = 10
  attr_reader :planes, :capacity

  def initialize(capacity=DEFAULT_VALUE)
    @planes = []
    @capacity = capacity
  end


  def full?
    @planes.size >= @capacity
  end

end
