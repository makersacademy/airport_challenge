class Weather

  OUTLOOK = [:stormy, :sunny, :cloudy, :windy].freeze

  def stormy?
    check_weather == :stormy
  end

  private

  def check_weather
    OUTLOOK.sample
  end

end
