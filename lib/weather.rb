class Stormy_Weather
  attr_reader :random_weather
  STORM_PROBABILITY = 2

  def report
    if random_weather <= STORM_PROBABILITY
      true
    else false
    end
  end

  private

  def generate_weather
    random_weather = rand(11)
  end


end
