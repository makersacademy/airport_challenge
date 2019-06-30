require 'pry'
require 'plane'

class Airport
  DEFAULT_CAPACITY = 10

  def initialize(capacity = DEFAULT_CAPACITY)
    @planes = []
    @capacity = capacity
    @weather = weather_state
  end

  def planes
    @planes
  end

  def capacity
    @capacity
  end

  def weather
    @weather
  end

  def land(plane)
    fail 'Airport is full' if full?
    fail 'Weather is stormy' if stormy?
    planes << plane
  end

  def take_off
    fail "No planes at airport" if empty?
    fail 'Weather is stormy' if stormy?
    "Plane takes off"
    planes.pop
  end

  def weather_state
    weather = ['sunny', 'sunny', 'sunny', 'stormy']
    weather.sample
  end

private

  attr_reader :plane

  def full?
    planes.count >= capacity
  end

  def empty?
    planes.empty?
  end

  def stormy?
    weather_state == 'stormy'
  end
  binding.pry

end
