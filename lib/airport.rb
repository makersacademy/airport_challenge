require_relative 'airplane'

class Airport
  DEFAULT_VALUE = 10
  attr_reader :planes, :capacity

  def initialize
    @planes = []
    @capacity = DEFAULT_VALUE
  end

  private
  
  def full?
    @planes.size == @capacity
  end

end
