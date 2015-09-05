require_relative 'plane'

class Airport

  attr_reader :capacity, :planes

  def initialize
    @capacity = 20
    @planes = []
  end

  def allow_take_off
    if forecast == 'stormy'
      fail "Sorry pilot, bad weather is forecast.."
    elsif @planes.empty?
      fail "No planes at the airport.."
    else
      plane = @planes.pop
      plane.take_off
    end
  end

  def allow_land(plane)
    if full?
      fail "Airport is full pilot.."
    elsif forecast == 'stormy'
      fail "Sorry pilot, bad weather is forecast.."
    else
      plane.land
      @planes << plane
    end
  end

  def forecast
    num = rand(2) #assuming this airport is in the UK
    return 'stormy' if num == 2
    'sunny'
  end

  def full?
    @planes.count >= 20
  end
end
