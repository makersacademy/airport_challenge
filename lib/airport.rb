require 'plane.rb'

class Airport
  attr_reader :bunker, :capacity
  DEFAULT_CAPACITY = 125
  def initialize(capacity = DEFAULT_CAPACITY)
    @bunker = []
    @capacity = capacity
  end
  def land(plane)
    return raise "Do not land, airport is full" if full?
    @bunker << Plane.new
  end
  def takeoff(plane)
    return raise "No planes available for take off" if empty?
    @bunker.pop
  end

  private
  def full?
    @bunker.length >= @capacity ? true : false
  end
  def empty?
    @bunker.empty?
  end


end
