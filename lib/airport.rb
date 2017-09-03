require_relative 'plane.rb'

DEFAULT_CAPACITY = 10

class Airport
  attr_accessor :planes
  attr_reader :capacity

  def initialize(capacity = DEFAULT_CAPACITY)
    @planes = []
    @capacity = capacity
  end

  def land(plane)
    fail "Unable to land due to stormy weather" if stormy?
    fail "Unable to land due to full capacity" if full?
    @planes << plane
  end

  def take_off(plane)
    fail "Unable to take_off due to stormy weather" if stormy?
    @planes.delete(plane)
  end

  def taken_off?(plane)
    true
  end

  def full?
    @planes.count >= @capacity
  end

  def stormy?
    todays_weather == :stormy
  end

private
  WEATHER = [:sunny, :cloudy, :rainy, :stormy]

  def todays_weather
    WEATHER.shuffle.first
  end

    def planes
      @planes
    end
end
