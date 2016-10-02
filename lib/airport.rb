class Airport

def initialize(capacity)
   @capacity = capacity
   @planes_at_airport = []
end

def land(plane)
  raise "can't land plane, airport is full" if full?
  raise "can't land plane due to stormy weather" if stormy?
  @planes_at_airport << plane
end

def confirm_land(plane)
end

def take_off(plane)
  raise "can't take off due to stormy weather" if stormy?
  #@planes_at_airport.pop
end

def confirm_take_off(plane)
end

private

def full?
  @planes_at_airport.length >= @capacity
end

def stormy?
  rand(1..10) > 7
end

end
