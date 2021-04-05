class Weather
  def present_weather
    rand(1..10) < 8 ? :clear : :stormy 
  end  
end
