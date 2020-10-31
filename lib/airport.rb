require_relative '../lib/plane'

class Airport
  attr_reader :planes, :capacity

  def initialize(cap = 1)
    @planes = []
    @capacity = cap
  end

  def land(plane)
    @planes << plane
  end

  def takeoff
    raise 'Takeoff aborted' if stormy?

    @planes.pop
  end

  def stormy?
    random_weather == :stormy
  end

  private

  WEATHER = %i[stormy sunny clear overcast].freeze

  def random_weather
    WEATHER.sample
  end
end
