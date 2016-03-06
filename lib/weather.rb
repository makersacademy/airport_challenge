class Weather


  def self.stormy?
    forecast == :stormy
  end

  private


  WEATHER_SEED = { :sunny => 19, :stormy => 1 }

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
