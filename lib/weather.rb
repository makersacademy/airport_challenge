class Weather
  def forecast
    return 'stormy' if rand(10).zero?
    
    'sunny'
  end
end
