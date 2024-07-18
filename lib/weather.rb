class Weather
  def forecast
    :stormy if rand(10) > 2
    :sunny
  end
end
