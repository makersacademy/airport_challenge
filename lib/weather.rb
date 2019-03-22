class Weather
  attr_reader :number

  def initialize
    @number = rand(1..4)
  end

  def generate_weather(number = @number)
    if number == 1
      "stormy"
    else
      "sunny"
    end
  end

end
