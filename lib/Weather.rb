class Weather

  attr_accessor :current_weather

  def initialize
    @current_weather = "clear"
  end

  def forecast
    self.current_weather= ["clear", "stormy"].sample
  end

end
