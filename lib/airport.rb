require_relative 'plane'
require_relative 'weather'

class Airport
  attr_reader :landed_planes, :capacity, :stormy_weather

  DEFAULT_CAPACITY = 40

  def initialize(capacity=DEFAULT_CAPACITY)
    @landed_planes = []
    @capacity = capacity
    @stormy_weather = (Weather.new).stormy_weather
  end

  def full
    full = landed_planes.count > capacity
  end

end
