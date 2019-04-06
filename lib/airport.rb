require_relative 'plane'

class Airport

  CAPACITY = 5

  attr_reader :capacity
  attr_reader :planes

  def initialize(capacity = CAPACITY)
    @capacity = CAPACITY
    @planes = []
  end

  def takeoff(plane)
    fail "Plane cannot take off in this weather" if storm?
    plane = @planes.pop
    "#{plane} has taken off"
  end

  def land(plane)
    fail "Plane cannot land in this weather" if storm?
    @planes << plane
    plane
  end

  private

  def full?
    @planes.count >= @capacity
  end

  def storm?
    random_forecast == :stormy
  end

  FORECASTS = [:stormy, :normal, :normal, :normal]

  def random_forecast
    FORECASTS.sample
  end

end
