class Airport
  attr_reader :planes
  attr_accessor :capacity
  DEFAULT_CAPACITY = 10
  POSSIBLE_WEATHER = ["sun", "storm", "clouds", "fog", "rain", "snow"]

  def initialize(capacity=DEFAULT_CAPACITY)
    @planes = []
    @capacity = capacity
  end

  def add(plane)
    @planes << plane
  end

  def remove(plane)
    @planes.delete(plane)
  end

  def adverse_weather?
    weather == "storm"
  end

  def full?
    @planes.count == @capacity
  end

  private
  def weather
    POSSIBLE_WEATHER.sample.downcase
  end
end
