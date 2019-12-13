class Airport
  attr_reader :runway

   def initialize
     @runway = []
  end

  def land(plane)
    # fail 'Airport full'
    @runway << plane
  end

  def take_off
    fail 'No planes at airport' if @runway.empty? == true
    @runway.pop
  end
end

class Plane
end
