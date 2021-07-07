class Weather
  attr_reader :status, :random_number

  def random_weather
    @random_number = generate_random_number
    if (1..8).include?(@random_number)
      @status = "Sunny"
    else
      @status = "Stormy"
    end
  end

  def generate_random_number
    rand(1..10)
  end
end
