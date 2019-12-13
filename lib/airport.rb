class Airport
  attr_reader :runway, :capacity

   def initialize
     @runway = []
     @capacity = 20
  end

  def land(plane)
    fail 'Airport full' if @runway.count >= capacity
    @runway << plane
  end

  def take_off
    fail 'No planes at airport' if @runway.empty? == true
    @runway.pop
  end
end

class Plane
end
