class Weather
  attr_reader :forecast
  def initialize
    n = rand(1..10)
    if n <= 3
      @forecast = "stormy"
    else
      @forecast = "sunny"
    end
  end

end
