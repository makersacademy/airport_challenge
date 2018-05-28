class Weather

  def initialize(weather=rand(10))
    @weather = weather
  end

  def stormy?
    if @weather < 2
      @weather = true
    else
      @weather = false
    end
  end

end
