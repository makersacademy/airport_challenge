class Weather
  attr_reader :forecast

  def initialize(state = "good")
    @forecast = state 
  end

end
