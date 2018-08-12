class Weather
  def stormy?
    # 20% chance of storm
    [true, false, false, false, false].sample
  end
end
