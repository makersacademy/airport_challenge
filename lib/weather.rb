class Weather
  attr_reader :forecast

  def initialize
    @forecast = rand > 0.2 ? "good" : "stormy" 
  end

end
