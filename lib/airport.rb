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
    fail "Stormy weather" if stormy?
    planes.pop.take_off
  end

  def instruct_landing(plane)
    fail "Airport full" if full?
    fail "Stormy weather" if stormy?
     plane.land
     planes << plane
  end

  def stormy?
    #Chance of storms is 20%
    Random.new(5) == 0 ? true : false
  end

  private

  attr_reader :planes

  def full?
    planes.count >= capacity
  end

  def empty?
    planes.empty?
  end
end