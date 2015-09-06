require_relative 'plane'

class Airport

  attr_reader :capacity, :planes

  def initialize
    @capacity = 20
    @planes = []
  end

  def allow_take_off
    if num_rand == 1
      fail "Sorry, bad weather"
    elsif @planes.empty?
      fail "No planes at the airport"
    else
      plane = @planes.pop
      plane.take_off
      plane
    end
  end

  def allow_land(plane)
    if num_rand == 1
      fail "Sorry, bad weather"
    elsif full?
      fail "Airport is full pilot"
    else
      plane.land
      @planes << plane
    end
  end

  def forecast
    return "stormy" if num_rand == 1
    "sunny"
  end

private

  def num_rand
    rand(2) #assuming this airport is in the UK
  end
  
  def full?
    @planes.count >= 20
  end
end
