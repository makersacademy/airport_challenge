class Weather
  attr_reader :number

  def initialize
    @number = rand(1..4)
    generate_weather
  end

  def generate_weather(number = @number)
    (number != 1)
    false
  end

end
