class Airport

  def initialize(capacity)
    @capacity = capacity
    @planes_in_airport = []
  end

  def land(plane)
    raise "airport is full, can't land plane" if full?
    @planes_in_airport << plane
  end

  def take_off(plane)
    @planes_in_airport.pop
  end

  private
  
  def full?
    @planes_in_airport.size >= @capacity ? true : false
  end
end
