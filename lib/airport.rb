require_relative 'plane'
class Airport

  DEFAULT_CAPACITY = 10  
  attr_accessor :planes_in_airport

  def initialize(capacity = DEFAULT_CAPACITY)
    @capacity = capacity
    @planes_in_airport = []
  end

  def land(plane)
    raise "This plane is already in the airport." if @planes_in_airport.include?(plane)
    raise "Airport full, landing not possible." if @capacity == @planes_in_airport.count
    @planes_in_airport << plane
  end

  def take_off(plane)
    @planes_in_airport.delete(plane)
    "#{plane} has successfully taken_off from #{self}."
  end

end
