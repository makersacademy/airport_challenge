module Weather

  FORECAST = [:fine, :fine, :stormy, :fine, :fine, :stormy, :fine] #a typical london week

  def stormy?
    random_outlook == :stormy
  end

  def random_outlook
    FORECAST.sample
  end

end
