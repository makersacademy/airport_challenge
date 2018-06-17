class Weather
  attr_reader :condition

  def initialize
    # gives a 20% chance for bad weather
    if rand(10) < 8
      @condition = 'clear'
    else
      @condition = 'stormy'
    end
  end
end
