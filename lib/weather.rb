class Weather
  def initialize
    @stormy_weather = nil
  end

  def generate_weather
  random_number = rand(10)
    if random_number < 2
      @stormy_weather = true
    else
      @stormy_weather = false
    end
  end

  def unsafe_to_fly?
      @stormy_weather
  end
end
