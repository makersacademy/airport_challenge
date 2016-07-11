require_relative 'plane'

class Airport
DEF_CAP = 20

  attr_reader :planes
  attr_reader :cap

  def initialize(cap = DEF_CAP)
    @cap = cap
    @planes = []
  end

  def docked(plane)
    if plane.landed == true
      @planes << plane
    else @planes - [plane]
    end
  end


  def weather
    @weather_gen = Random.rand(100)
    @weather_gen >= 10 ? sunny : stormy
  end

  def full?
    @planes.count > 20 ? true : false
  end
end
