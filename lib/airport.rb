
class Airport
     
  def initialize(capacity)
    @capacity = capacity
    @flights = []
  end

  def land(plane)
    raise 'No landing permitted due to bad weather' if stormy?
    raise 'Airport is full' if full?
    @flights.push(plane)

  end

  def takeoff(plane)
    raise 'No takeoff permitted due to bad weather' if stormy?

  end
end

private

def stormy?
   rand(1..6) > 4
 end

def full?
  @flights.count >= @capacity
end
