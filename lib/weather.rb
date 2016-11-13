class Weather

attr_accessor :today, :weathers

  def initialize
    @today = "sunny"
    @weathers = ["Sunny", "Stormy", "Sunny", "Sunny"]
  end

  def randomise
    rand(4)
  end

  def todays_weather
    @weathers[randomise]
  end


end
