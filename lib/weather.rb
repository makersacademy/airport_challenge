class Weather
  attr_reader :forecast
  def initialize
    @forecast = forecast
    condition = rand(0..9)
    if condition == 3
      @forecast = "stormy"
    else
      @forecast = "fine"
    end
  end
end
