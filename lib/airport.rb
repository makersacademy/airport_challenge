require_relative 'plane'

class Airport

DEFAULT_CAPACITY = 50

  attr_accessor :capacity

  def initialize(capacity = DEFAULT_CAPACITY)
    @planes = []
    @capacity = capacity
  end

  def instruct_takeoff
    fail "No planes in airport" if empty?
    planes.pop
  end

  def instruct_landing(plane)
    fail "Airport full" if full?
     planes << plane
  end


  private

  attr_reader :planes

  def full?
    planes.count >= @capacity
  end

  def empty?
    planes.empty?
  end
end