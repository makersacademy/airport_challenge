class Weather

  def initialize(weather_score = rand(9))
    @weather_score = weather_score
  end

  def condition
    @weather_score <= 7 ? "sunny" : "stormy"
  end
  
end
