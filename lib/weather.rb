class Weather

  def initialize
    @weather == "Clear"
  end

  def set_weather
    if rand() > 0.3
      @weather == "Stormy"
    end
  end

end
