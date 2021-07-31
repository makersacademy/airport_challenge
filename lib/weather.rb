class Weather
  
  attr :weather_chart

  def initialize(weather_chart)
    @weather_chart = weather_chart
  end
 
  def weather
    weather_chart.sample
  end

  def isStormy?
    weather == :stormy
  end
end

weather_test = Weather.new([:sunny, :stormy, :sunny, :stormy, :sunny, :sunny, :sunny] )
puts weather_test.isStormy?