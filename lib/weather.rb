class Weather

  attr_accessor :stormy
  attr_reader :TOTAL_WEATHERS
  attr_reader :STORMY_WEATHERS

  TOTAL_WEATHERS = 11
  STORMY_WEATHERS = 3

  def report
    weather_number = rand(TOTAL_WEATHERS)
    if weather_number <= STORMY_WEATHERS
      @stormy = true
    else
      @stormy = false
    end
  end
end
