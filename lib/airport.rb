require_relative 'plane'
require_relative 'weather'

class Airport
  attr_reader :planes, :capacity

  DEFAULT_CAPACITY = 10

  def initialize(capacity=DEFAULT_CAPACITY)
    @planes = []
    @capacity = capacity
  end

  def land(plane, weather)
    if weather.current_conditions == "stormy"
      raise "Weather is stormy: permission to land denied"
    elsif full?
      raise "Airport is full, unable to land plane"
    else
      @planes << plane
    end
  end

  def takeoff(plane, weather)
    if weather.current_conditions == "stormy"
      raise "Weather is stormy: permission to takeoff denied"
    else
      @planes[0]
    end
  end

  private

  def full?
    @planes.length == @capacity
  end
end
