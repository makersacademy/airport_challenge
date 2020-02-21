class Airport

def initialize(capacity)
  @capacity = capacity
  @planes = []
end
 def land(plane)
   raise 'Airport is full' if full?
   @planes << plane
 end

 def take_off(plane)
 end

 private

 def full?
   @planes.length >= @capacity
 end

end
