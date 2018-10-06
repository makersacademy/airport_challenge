

class Airport
  attr_reader :flights
  def initialize
    @flights = []
  end

  def land(plane)
    @flights << plane
  end

  def takeoff(plane)
    fail 'No takeoff due to bad weather condition' if stormy?
    @flights.delete(plane)
  end

  private
  def stormy?
    rand(3..10) > 6

  end



end
