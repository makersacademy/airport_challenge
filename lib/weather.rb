class Weather

  def initialize(stormy_weather = false)
    @stormy_weather = stormy_weather
  end

  def report
    weather = rand(10)
    if weather <= 8
      @stormy_weather = false
    else @stormy_weather = true
    end
  end

end
