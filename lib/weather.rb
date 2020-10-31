class Weather
  def forecast
    return :stormy if rand(10) > 6

    return :sunny
  end
end
