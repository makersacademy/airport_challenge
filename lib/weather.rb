class Weather
  def stormy?
    prognosis == :stormy
  end
  WEATHERS = [:stormy, :fine, :fine, :fine]
  def prognosis
    WEATHERS.sample
  end
end
