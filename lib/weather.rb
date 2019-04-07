class Weather
  # attr_reader :forecast
  #
  # def initialize
  #   @forecast = Weather.randomiser
  # end

  def randomiser
    odds = rand(1..10)
    if odds == 8
      "stormy"
    else
      "sunny"
    end
  end
end
