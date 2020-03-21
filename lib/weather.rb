class Weather
  CHANCE_OF_STORM = 0.2
  def stormy?
    rand < CHANCE_OF_STORM
  end

end
