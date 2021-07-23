class Weather

  def stormy?
    outlook == :stormy
  end

  WEATHERS = [:stormy, :sunny, :fine, :cloudy]
  def outlook
    WEATHERS.sample
  end
end