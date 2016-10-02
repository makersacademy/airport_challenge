class Airport

  def initialize(capacity)
    @capacity = capacity
    @planes_in_airport = []
  end

  def land(plane)
    raise "airport is full, can't land plane" if @planes_in_airport.count >= @capacity
    @planes_in_airport << plane
  end

  def take_off(plane)
    #@planes_in_airport -= 1
  end
end
