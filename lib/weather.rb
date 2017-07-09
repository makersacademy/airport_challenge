module Weather

  OUTLOOK = [:stormy, :sunny, :cloudy, :windy].freeze

  def stormy?
    weather == :stormy
  end

  private

  def weather
    OUTLOOK.sample
  end

end
