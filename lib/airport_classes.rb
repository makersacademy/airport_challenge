class Airport
  attr_reader :runway, :capacity
  def initialize(capacity = 10)
    @runway = []
    @capacity = capacity
  end

  def land(plane)
    if @runway.length == @capacity
      puts "Airport is full, sorry. Plane must turn back."
    else
      @runway << plane
    end
  end

  def takeoff(plane)
    @runway.delete(plane)
    return plane
  end
end

class Plane

end
