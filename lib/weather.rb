# create class Weather with attribute accessors for current_weather
# and random_number
class Weather
  attr_accessor :current_weather, :random_number

  # generate a random number between 1 and 10, and assign to instance variable
  def initialize
    @random_number = rand(1..10)
  end

  # return a weather depending on the random number generated
  def random_weather
    if (1..8).include?(@random_number)
      "Sunny"
    else
      "Stormy"
    end
  end
end
