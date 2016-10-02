require_relative 'plane'

class Airport
  attr_reader :landed_planes, :capacity
  attr_accessor :stormy_weather

  DEFAULT_CAPACITY = 40

  def initialize(capacity=DEFAULT_CAPACITY)
    @landed_planes = []
    @capacity = capacity
    @stormy_weather = stormy_weather_randomiser
  end

  def full
    landed_planes.count > capacity
  end

private

  def stormy_weather_randomiser
    rand(0...10)< 1 ? true : false
  end

end
