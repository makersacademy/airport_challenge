class Weather


  def stormy?
    forecast == :stormy
  end

  private

  WEATHER_SEED = { sunny: 19, stormy: 1 }.freeze

  def weather_array
    weather = []
    WEATHER_SEED.each do |condition, weight|
      weight.times { weather << condition }
    end
    weather
  end


  def forecast
    weather_array.sample
  end

end
