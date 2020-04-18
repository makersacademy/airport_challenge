class Weather
  attr_reader :storm_probability
  DEFAULT_PROBABILITY = 70

  def initialize(probablity = DEFAULT_PROBABILITY)
    @storm_probability = probablity
  end

  def is_stormy?
    @storm_probability > chance ? is_stormy_message : false
  end

  private
  def chance
    rand(1..100)
  end

  def is_stormy_message
    fail "Weather is stormy"
  end
end
