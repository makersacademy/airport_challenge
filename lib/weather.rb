class Weather

  ERR_STORM_PROB = "Storm probability should be in the range [0,1]"

  def initialize(storm_prob = 0.25)
    raise ERR_STORM_PROB if storm_prob.negative? || storm_prob > 1

    @storm_prob = storm_prob
  end

  def stormy?
    rand() <= @storm_prob
  end
end
