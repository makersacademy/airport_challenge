require './lib/plane.rb'

class Weather
  attr_reader :storm

  def initialize
    @storm = false
  end

  def conjure_storm
    @storm = true
  end

  def bring_the_sun
    @storm = false
  end
end
