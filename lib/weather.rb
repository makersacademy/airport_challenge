class Weather

  def initialize
    @stormy = false
  end

  def weather_report
    weather = rand
    if weather < 0.1
      stormy = true
    else
      stormy = false
    end
  end

  def stormy?
    @stormy
  end

end
