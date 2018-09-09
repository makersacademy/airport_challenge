class Weather

  attr_reader :stormy_probability

  def initialize(stormy_probability = 0.5)
    @stormy_probability = stormy_probability
  end

  def check_weather
    rand > stormy_probability ? :stormy : :clear
  end

end
