class Airport
  DEFAULT = 10
  attr_reader :runway, :capacity
  def initialize(capacity = DEFAULT)
    @runway = []
    @capacity = capacity
  end

  # This is how you land a plane, unless of course the airport is at capacity
  def land(plane)
    if stormy?
      puts 'WARNING: Too stormy to allow planes to land at this time!'
    elsif @runway.length == @capacity
      puts "Airport is full, sorry. Plane must turn back."
    else
      @runway << plane
    end
  end

# This allows a given plane to takeoff (be removed from runway)
  def takeoff(plane)
    if stormy?
      puts 'WARNING: Too stormy to allow planes to takeoff at this time!'
    else
      @runway.delete(plane)
      return plane
    end
  end

  def stormy?
    return true if (rand(100) % 10).zero?

    return false
  end

end

class Plane

end
