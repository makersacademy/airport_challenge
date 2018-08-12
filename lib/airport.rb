require './lib/plane'

class Airport

  DEFAULT_CAPACITY = 2

  attr_reader :planes
  attr_reader :stormy
  attr_reader :capacity

  def initialize(capacity = DEFAULT_CAPACITY)
    @planes = []
    @capacity = capacity
  end

  def land(plane)
    fail "Weather is stormy - no landing, please" if stormy
    @planes << plane
    planes[0]
  end

  def take_off
    fail "Weather is stormy - no taking off, please" if stormy
    @planes.pop
    planes[-1]
  end

  def weather
    @stormy = false
  end

  def variable_weather
    chance = rand(1..20)
    if chance == 20
      @stormy = true
    else
      @stormy = false
    end
  end

  def report_stormy
    @stormy = true
  end

end
