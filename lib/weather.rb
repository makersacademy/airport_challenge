class Weather

  def inclement?
    random_weather == :inclement?
  end

  private

  WEATHER_STATUS = [:inclement, :clear, :clear, :inclement, :inclement, :clear]

  def random_weather
    WEATHER_STATUS.sample
  end
end
