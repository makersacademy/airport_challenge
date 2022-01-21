class Weather
  
  def randomWeather 
    probability = rand(1..26) 
    
    if probability <= 25 
      return "chance of sun"
    else
      return "chance of storm"
    end

  end

end