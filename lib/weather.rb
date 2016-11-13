class Weather

attr_accessor :weathers

  def initialize
    @weathers = [:Sunny, :Stormy, :Sunny, :Sunny]
  end

  def randomise
    rand(4)
  end

  def todays_weather
    @weathers[randomise]
  end


end
