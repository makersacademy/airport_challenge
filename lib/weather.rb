class Weather

  def sunny?
    FORECAST.sample == :sunny
  end

  FORECAST = [:sunny, :sunny, :sunny, :stormy]

end
