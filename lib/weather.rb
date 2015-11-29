class Weather
  attr_reader :current_weather

  def initialize
    if rand(10) == 4
      @current_weather = :stormy
    else
      @current_weather = :sunny
    end
  end
end
