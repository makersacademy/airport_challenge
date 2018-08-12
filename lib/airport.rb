require './lib/plane'

class Airport

  attr_reader :planes
  attr_reader :stormy

  def initialize
    @planes = []
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
