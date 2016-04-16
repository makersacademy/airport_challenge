require_relative 'plane'

class Airport

DEFAULT_CAPACITY = 50

  attr_reader :planes

  def initialize
    @planes = []
  end

  def instruct_takeoff
    raise "No planes in airport" if empty?
    plane = @planes.pop
  end

  def instruct_landing(plane)
    raise "Gate full" if full?
     @planes << plane
  end


private

  def full?
    @planes.count >= DEFAULT_CAPACITY
  end

  def empty?
    @planes.empty?
  end
end