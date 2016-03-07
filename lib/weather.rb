module Weather

  def stormy?
    random_weather == :stormy
  end

  private

  SKY = [:stormy, :sunny, :sunny].freeze

  def random_weather
    SKY.sample
  end

end