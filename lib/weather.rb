class Weather 
  attr_reader :possible_weather
  def initialize 
    @possible_weather = [0..2000].map{:normal} + [0..1].map{:normal}
  end

  def forecast
    @possible_weather.sample
  end
end