require_relative 'plane'
class Airport
  
  attr_reader :capacity
  DEFAULT_CAPACITY = 100

  def initialize(capacity = DEFAULT_CAPACITY)
    @capacity = capacity
    @hangar = []
  end

  def land(plane)
    raise "Hangar is full" if @hangar.length >= capacity
    @hangar << plane
  end

  def takeoff
    raise "No planes in hangar" if @hangar.empty?
    @hangar.pop
  end
end