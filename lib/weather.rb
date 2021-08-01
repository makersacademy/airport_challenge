class Weather 
  attr_reader :possible_weather
  def initialize 
    @possible_weather = [0..50].map{:normal} + [0..5].map{:stormy}
  end

  def forecast
    @possible_weather.sample
  end
end