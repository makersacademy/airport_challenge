class Weather
  attr_reader :forecast
  def initialize
    i = rand(6)
    if i >= 5
      @forecast = "stormy"
    else
      @forecast = "fine"
    end
  end
end
