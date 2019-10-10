require_relative 'plane'

module Weather
  def weather_condition
    weather = ["sunny", "sunny", "stormy"]
    weather.sample
  end
end

class Airport
  include Weather
  DEFAULT_CAPACITY = 20
  attr_reader :plane, :capacity

  def initialize(capacity = DEFAULT_CAPACITY)
    @planes = []
    @capacity = capacity
  end

  # the land methods creates instances of planes
  # is an instance variable to store planes
  def landing(plane)
    fail 'airport is full' if full?
    fail 'cant land due to storm' if weather_condition == "stormy"
    @planes << plane
  end

  # plane departs, one less plane in airport each time, unless weather is stormy
  def departing
    fail 'no planes at the airport' if empty?
    fail 'cant fly due to storm' if weather_condition == "stormy"
    @planes.pop
  end

  private
  def full?
    @planes.count >= capacity
  end

  def empty?
    @planes.empty?
  end

end