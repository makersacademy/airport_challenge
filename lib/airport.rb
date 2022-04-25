require_relative 'plane'

class Airport
  DEFAULT_CAPACITY = 3

  # makes capacity variable
  attr_accessor :capacity
  attr_accessor :planes_at_airport

  def initialize(capacity = DEFAULT_CAPACITY)
    @planes_at_airport = []
    @capacity = capacity
  end

  def land(_plane)
    fail 'Airport full' if full?
    fail 'Not able to land due to storm' if storm?
    
    planes_at_airport << Plane.new
    landed_plane = planes_at_airport.last 
    "#{landed_plane} has landed"
  end

  def take_off(_plane)
    fail 'No planes available' if empty?
    fail 'Not able to take off due to storm' if storm?
    
    departed_plane = planes_at_airport.pop
    "#{departed_plane} has taken off" 
  end

  private

  def full?
    planes_at_airport.count >= capacity
  end

  def empty?
    planes_at_airport.empty?
  end
  
  def storm?
    rand(10) >= 8
  end

end
