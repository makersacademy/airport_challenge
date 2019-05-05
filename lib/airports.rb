require_relative './planes.rb'

class Airport

  attr_accessor :planes
  attr_reader :capacity

  def initialize(capacity = 10)
    @planes = []
    @capacity = capacity
  end

  def at_capacity?
    @planes.size >= @capacity
  end

  def stormy?
    rand(10) < 2
  end
end
