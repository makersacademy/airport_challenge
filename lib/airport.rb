require_relative 'plane'

class Airport
  DEFAULT_CAPACITY = 25

  attr_reader :planes
  attr_accessor :capacity

  def initialize(capacity = DEFAULT_CAPACITY)
    @capacity = capacity
    @planes = []
  end

  def stormy?
    weather = ["Sunny", "Stormy"].sample
    weather == "Stormy"
  end

  def land(weather, plane)
    fail 'Airport full!' if full?
    fail 'Weather is stormy!' if weather.stormy?
    planes << plane
  end

  def takeoff(weather)
    fail 'Weather is stormy!' if weather.stormy?
    planes.pop
  end

  def confirm
    planes.count
  end

  private

  def full?
    planes.count >= capacity
  end
end
