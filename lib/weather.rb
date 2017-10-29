class Weather

  def stormy?
    forecast = %i[sunny sunny sunny sunny stormy]
    forecast.sample == :stormy
  end
end
