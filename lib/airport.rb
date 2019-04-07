require_relative 'plane'
require_relative 'weather'

class Airport

  CAPACITY = 5

  attr_accessor :capacity
  attr_reader :planes
  attr_reader :weather

  def initialize(capacity = CAPACITY)
    @capacity = capacity
    @planes = [].concat new_plane
    @weather = Weather.new
  end

  def takeoff(plane)
    fail "Plane cannot take off in this weather" if storm

    @planes.delete(plane)
    "Plane has taken off"
  end

  def land(plane)
    fail "No space for plane to land" if full
    fail "Plane cannot land in this weather" if storm

    @planes << plane
    "Plane has landed"
  end

  def storm
    random_forecast == :stormy
  end

  private

  def new_plane
    Array.new(rand(1..capacity)) { Plane.new }
  end

  def full
    @planes.count >= @capacity
  end

  FORECASTS = [:stormy, :normal, :normal, :normal]

  def random_forecast
    FORECASTS.sample
  end

end
