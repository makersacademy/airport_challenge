class Weather
  attr_accessor :what_is_weather

  def initialize
    rand(0..4).zero? ? @what_is_weather = 'stormy' : @what_is_weather = 'sunny'
  end

end
