class Weather
  attr_reader :status, :random_number

  def random_weather
    @random_number = generate_random_number
  end

  def generate_random_number
    rand(1..10)
  end
end
