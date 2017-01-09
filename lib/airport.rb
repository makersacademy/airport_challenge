require_relative 'plane'

class Airport

  DEFAULT_CAPACITY = 40
  attr_reader :planes
  attr_reader :capacity

  def initialize(capacity = DEFAULT_CAPACITY)
    @planes = [] #array of planes in the airport
    @capacity = capacity
  end

  def land(plane)
    if plane.status == false
      raise "The plane is already in airport"
    else
      if full?
        raise "The airport is full"
      else
        @planes << plane
        plane.status = false
        true
        p "#{plane} has landed and overall these #{@planes} are available"
      end
    end
  end

  def send(plane)
    if plane.status == true
      raise "The plane is already flying"
    else
    #  if stormy?
    #    "Taking-off is not permitted due to a storm"
    #  else
        @planes.delete(plane)
        plane.status = true
        true

    end
  end



  def full?
    @planes.count >= capacity
  end

end
