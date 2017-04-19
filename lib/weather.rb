class Weather

  attr_reader :stormy

  def initialize
    @stormy = randomise_weather
  end

  def randomise_weather
    n = rand(2..2)
    if n == 1
      true
    else
      false
    end
  end

end
