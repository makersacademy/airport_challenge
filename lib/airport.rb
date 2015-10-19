require_relative 'plane'
require_relative 'weather'

class Airport < Weather
  attr_reader :plane, :capacity
  DEFAULT_CAPACITY = 10

  def initialize(capacity=DEFAULT_CAPACITY)
    @planes = []
    @capacity = capacity
  end

  def inventory
    @planes
  end

  def land_plane plane
    fail 'The airport is full' if full?
    fail 'Is stormy so cannot land' if stormy
    plane.land
    @planes << plane
  end

  def take_off plane
    fail 'Is stormy so cannot take off' if stormy
    plane.take_off
    @planes.delete(plane)
  end

  def stormy
    weather_forecast
  end

  private
  def full?
    @planes.count >= @capacity
  end

end
