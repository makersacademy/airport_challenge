require_relative 'plane'
class Airport

  DEFAULT_CAPACITY = 10  
  attr_accessor :planes_in_airport

  def initialize(capacity = DEFAULT_CAPACITY)
    @capacity = capacity
    @planes_in_airport = []
  end

  def land(plane)
    if @capacity == @planes_in_airport.count
      raise "Airport full, landing not possible."
    else
      @planes_in_airport << plane
    end
  end

  def take_off(plane)
    @planes_in_airport.delete(plane)
    "#{plane} has successfully taken_off from #{self}."
  end

end
