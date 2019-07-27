class Weather

  def initialize(storm_prob = 0.2)
    @storm_prob = storm_prob
  end

  def stormy?
    rand < @storm_prob
  end

end
