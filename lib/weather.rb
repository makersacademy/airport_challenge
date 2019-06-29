class Weather
  attr_accessor :current_weather

  def initialize
    @current_weather = 'sunny'
    @random_number = rand(25)
    @current_weather == 'stormy' if @random_number == 8 ||
      @random_number == 16
  end
end
