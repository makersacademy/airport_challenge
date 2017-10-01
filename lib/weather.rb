module Weather
  WEATHER_STATE = ["sunny", "mild", "cloudy", "misty", "rainy", "stormy"]
  
  def self.report
    WEATHER_STATE.sample
  end

end
