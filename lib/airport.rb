require_relative 'plane'

class Airport

  attr_reader :capacity, :planes


  def initialize
    @capacity = 20
    @planes = []
  end

  def allow_take_off
    if forecast == 'stormy'
      raise "Sorry pilot, bad weather is forecast.."
    else
      plane = @planes.pop
      plane.take_off
    end
  end

  def allow_land(plane)
    if full?
      raise "Airport is full pilot.."
    elsif forecast == 'stormy'
      raise "Sorry pilot, bad weather is forecast.."
    else
      plane.land
      @planes << plane
    end
  end

  def forecast
    num = rand(10)
    if num == 5
      return 'stormy'
    else
      return 'sunny'
    end
  end

  private

  def full?
    @planes.count >= @capacity
  end
end
