class Weather
  attr_reader :weather
    
  def rand_weather
    weather = [sunny, stormy].sample
  end
end
