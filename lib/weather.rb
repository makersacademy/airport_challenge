module Weather

STORM_PROBABILITY = 0.5#this is a floating point number between 1 and 0. The higher the number the higher the probability of storms. That is, if STORM_PROBABILITY = 1 then prob_threshold = 0 i.e. 100% chance that the weather is stormy ==> Weather.stormy? == true.

  def Weather.stormy?
    prob_threshold = (1 - STORM_PROBABILITY)
    rand > prob_threshold
  end
end
