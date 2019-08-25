require_relative 'plane'

class Airport
  attr_accessor :stormy
  attr_accessor :planes
  attr_reader :capacity
  $DEFAULT_CAPACITY = 5
  
  def initialize(capacity = $DEFAULT_CAPACITY)
    @planes = []
    @stormy = [true, false, false, false].sample
    @capacity = capacity
  end

  def confirm_departure(plane)
    return "#{plane} has failed to depart" if plane.parked_in?(self)

    "#{plane} has successfully departed"
  end

  def full?
    @planes.length == @capacity
  end
end
