require './lib/plane.rb'

class Weather
  attr_reader :storm

  def initialize
    @storm = random_weather
  end

  def conjure_storm
    @storm = true
  end

  def bring_the_sun
    @storm = false
  end

  def random_weather
    value = rand(9)
    return false if value >= 3
    return true  if value <3
  end
end
