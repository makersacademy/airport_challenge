require_relative 'plane'
class Airport

  attr_reader :capacity
  def initialize
    @capacity = []
  end

  def land(plane)
    capacity.push(plane)
  end
end
