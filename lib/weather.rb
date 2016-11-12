class Weather

  def initialize
    @stormy = false
  end

  def stormy?
    set_weather
    @stormy
  end

  private

  def set_weather
    weight = rand(3)
    @stormy = weight == 0

  end


end
