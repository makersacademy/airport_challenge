require_relative 'plane'

class Airport 
  attr_reader :planes
  DEFAULT_CAPACITY = 10

  def initialize
    @planes = []
  end

  def land(plane)
    raise 'Airport is full' if full?
    raise 'Too stormy to land' if stormy?
    @planes << plane
  end

  def takeoff(plane)
    @planes.pop
  end

  def no_longer_in_airport(plane)
    if @planes.include?(plane)
      return "The plane is in the airport"
    else 
      return "The plane is no longer in the airport"
    end
  end

  def full?
    @planes.length >= DEFAULT_CAPACITY
  end

  def stormy?
    rand(1..100) > 75
  end

end
