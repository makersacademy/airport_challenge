class Weather
  def forecast
    return 'stormy' if rand(10) == 0
    'sunny'
  end
end
