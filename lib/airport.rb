require_relative 'plane'

class Airport

  CAPACITY = 5

  attr_accessor :capacity
  attr_reader :planes

  def initialize(capacity = CAPACITY)
    @capacity = capacity
    @planes = [] << rand(1..capacity).times.collect {Plane.new}
  end

  def takeoff(plane)
    fail "Plane cannot take off in this weather" if storm
    plane = @planes.pop
    "Plane has taken off"
  end

  def land(plane)
    fail "No space for plane to land" if full
    fail "Plane cannot land in this weather" if storm
    @planes << plane
    plane
  end

  private

  def full
    @planes.count >= @capacity
  end

  def storm
    random_forecast == :stormy
  end

  FORECASTS = [:stormy, :normal, :normal, :normal]

  def random_forecast
    FORECASTS.sample
  end

end
