require_relative 'plane'

class Airport
  DEFAULT_CAPACITY = 100
  
  attr_reader :planes

  def initialize(capacity = DEFAULT_CAPACITY)
    @planes = []
    @capacity = capacity
  end

  def land(plane)
    fail 'Airport full' if full?

    fail 'Unsuitable weather conditions' if stormy?

    @planes << plane
  end

  def take_off(plane)
    fail 'Plane not in airport' unless in_airport?(plane)
    
    fail 'Unsuitable weather conditions' if stormy?

    @planes.delete(plane)
  end

  def planes_in_airport
    puts @planes
  end

  private
  def stormy?
    rand(1..25) == 25
  end

  def full?
    @planes.count >= @capacity
  end

  def in_airport?(plane)
    @planes.each do |x|
      if x == plane
        return true
      end
    end
    return false
  end

end
