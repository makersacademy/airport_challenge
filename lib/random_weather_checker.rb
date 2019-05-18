class RandomWeatherChecker
  def stormy?
    randomly_generated_boolean
  end

  private

  def randomly_generated_boolean
    chance_of_storminess = 0.2
    rand < chance_of_storminess
  end
end
