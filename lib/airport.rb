class Airport

  attr_reader :landing_strip, :capacity

  def initialize
    @landing_strip = []
    @capacity = 10
  end

  def land(plane)
    landing_strip << plane unless full?
  end

  def take_off
    landing_strip.pop unless stormy?
  end

private

  def full?
    landing_strip.count == capacity
  end

  def stormy?
    self.weather_condition == 'stormy'
  end

  # def landing_clear?
  #   true if !full? && !stormy?
  # end

  def weather_condition
    storm_index = Random.rand(1..10)
    'sunny' if storm_index <= 8
    'stormy'
  end
end
