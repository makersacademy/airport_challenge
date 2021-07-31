class Weather
  

  def weather
    weather_chart = [:sunny, :stormy, :sunny, :stormy, :sunny, :sunny, :sunny]
    weather_chart.sample
  end

  def isStormy?
    weather == :stormy
  end
end

# weather_test = Weather.new([:sunny, :stormy, :sunny, :stormy, :sunny, :sunny, :sunny] )
# puts weather_test.isStormy?