class Weather
  def forecast
    puts r = rand(10)
    return "Sunny" if r < 7
    return "Stormy"
  end
end