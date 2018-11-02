class Weather
  attr_accessor :what_is_weather

  def initialize
    @what_is_weather = ['sunny', 'stormy'].sample
  end
end
