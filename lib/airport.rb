require_relative 'plane'

class Airport
  attr_reader :airport, :capacity

  DEFAULT_CAPACITY = 50

  def initialize(capacity = DEFAULT_CAPACITY)
    @airport = []
    @capacity = capacity
  end

  def instruct_landing(plane)
    if full?
      'Abort landing, airport is full'
    elsif weather == 'stormy'
      'The weather is not suitable for landing'
    else
      @airport.push(plane)
      plane.land
    end
  end

  def instruct_takeoff(plane)
    if weather == 'stormy'
      'The weather is not suitable for takeoff'
    else
      @airport.delete(plane)
      plane.takeoff
    end
  end

  def weather
    rand(50) < 25 ? 'sunny' : 'stormy'
  end

  def full?
    @airport.length >= @capacity
  end
end
