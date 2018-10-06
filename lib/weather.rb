class Weather

  PROBABILITY_OF_STORM = 0.1

  # def initialize(stormy = false)
  #   @stormy = stormy
  # end
  #
  # def stormy?
  #   @stormy
  # end
  #
  # def report_storm
  #   @stormy = true
  # end

  def stormy?
    rand < PROBABILITY_OF_STORM
  end

end
