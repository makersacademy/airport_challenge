

class Weather

  attr_accessor :weather

  def initialize
    @weather = [:fine,:fine,:fine,:stormy][rand(4)]
  end

  def todays_weather
    @weather
  end

end
