class Weather

  def initialize(storm_probability = 0.2)
    @storm_probability = storm_probability
  end

  def stormy?
    rand() <= @storm_probability
  end

end
