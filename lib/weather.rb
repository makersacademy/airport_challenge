class Weather


  def self.stormy?
    forecast == :stormy
  end
  
  WEATHER_SEED = { sunny: 19, stormy: 1 }.freeze

  def self.weather_array
    weather = []
    WEATHER_SEED.each do |condition, weight|
      weight.times { weather << condition }
    end
    weather
  end

  def self.forecast
    weather_array.sample
  end

end
