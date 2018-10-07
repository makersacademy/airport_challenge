class Weather
  STORM_CHANCE = 0.05

  def stormy?
    rand < STORM_CHANCE
  end
end
