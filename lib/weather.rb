class Weather
  attr_reader :storm_probability
  DEFAULT_PROBABILITY = 70

  def initialize(probablity = DEFAULT_PROBABILITY)
    @storm_probability = probablity
  end

  def stormy?
    @storm_probability > chance ? stormy_message : false
  end

  private
  def chance
    rand(1..100)
  end

  def stormy_message
    fail "Weather is stormy"
  end
end
