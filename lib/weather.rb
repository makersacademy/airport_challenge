class Weather

  PROBABILITY_OF_STORM = 0.1

  def stormy?
    rand < PROBABILITY_OF_STORM
  end

end
