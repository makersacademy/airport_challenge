
class Weather
  attr_reader :current_weather

  def stormy?
    @current_weather = ["sunny", "sunny", "sunny", "sunny", "stormy"].sample
    (@current_weather == "stormy") ? true : false
  end

end
