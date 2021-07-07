class Weather
  attr_reader :stormy

  def random_weather_generation
    random_weather = rand(1..12)
    if random_weather == 1
      @stormy = true
    elsif random_weather == 2
      @stormy = true
    elsif random_weather == 3
      @stormy = true
    else
      @stormy = false
    end  
  end 
end 

