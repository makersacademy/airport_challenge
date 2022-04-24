class Weather

  WEATHER = [:sunny, :rainy, :stormy, :windy]

  def self.stormy?
    current_weather = WEATHER.sample
    current_weather == :stormy
  end

end