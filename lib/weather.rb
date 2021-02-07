class Weather

  DEFAULT_PROBABILITY = 0.2

  def initialize(storm_probability = DEFAULT_PROBABILITY)
    @storm_probability = storm_probability
  end

  def stormy?
    rand() <= @storm_probability
  end

end
