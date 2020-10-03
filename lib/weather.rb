class Weather
  attr_reader :weather_no, :weather

  def initialize
    @weather_no = rand(100)
    weather_calculator
  end

  def weather_calculator
    @weather_no.between?(11, 89) ? @weather = "clear" : @weather = "stormy"
  end

end
