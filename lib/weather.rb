class Weather
  attr_accessor :what_is_weather

  def initialize
    if rand(9) == 0
      @what_is_weather = 'stormy'
    else
      @what_is_weather = 'sunny'
    end
  end
end
