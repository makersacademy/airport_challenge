class Weather
  STORM_INDICATOR = 0.15

  def initialize(indicator = STORM_INDICATOR)
    @indicator = indicator
    @stormy = rand < indicator
  end

  attr_reader :stormy
  attr_accessor :indicator
end
