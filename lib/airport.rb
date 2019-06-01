require_relative 'plane'

class Airport

  attr_reader :landed

  def initialize
    @landed = []
  end

  def takeoff(*)
    @landed.pop
    "Plane has taken off from airport"
  end

  def land(*)
    @landed << plane
    "Plane has landed at airport"
  end

  def weather
    random_weather == :stormy
  end

private

  WEATHER = [:stormy, :sunny]

  def random_weather
    WEATHER.sample
  end

end
