class Weather
  STORM_CHANCE = 0.05

  def stormy?
    chance < STORM_CHANCE
  end

  private

  def chance
    rand
  end
end
