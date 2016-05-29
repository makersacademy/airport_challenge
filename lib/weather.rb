class Weather

  CHANCES_OF_STORM = 0.1 #percent

  def stormy?
    rand < CHANCES_OF_STORM
  end
end
