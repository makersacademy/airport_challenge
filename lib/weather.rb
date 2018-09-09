class Weather
  STORM_SCALE = rand(1...10)
  attr_reader :storm_scale
  def initialize
    @storm_scale = STORM_SCALE
  end

  def stormy?
    @storm_scale < 3
  end

end
