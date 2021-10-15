class Weather
  def forecast
    return "Sunny" if rand(10) < 7
    return "Stormy"
  end
end