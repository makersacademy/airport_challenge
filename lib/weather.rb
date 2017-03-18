class Weather

  def initialize(stormy_weather = false)
    @stormy_weather = stormy_weather
  end

  def report
    generate_weather = rand(10)
    if generate_weather <= 8
      @stormy_weather = false
    else @stormy_weather = true
    end
  end

end
