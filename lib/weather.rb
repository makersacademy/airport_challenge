class Weather

  attr_reader :current_weather

  def stormy?
    rand(1..10) >= 10 ? @current_weather = "stormy" : @current_weather = "sunny"
  end

end
