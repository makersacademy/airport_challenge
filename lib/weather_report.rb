class WeatherReport
  def initialize
    @weather = rand(6) == 0 ? 'stormy' : 'sunny'
  end

  def stormy?
    weather == 'stormy'
  end

  def sunny?
    weather == 'sunny'
  end

  private

  attr_reader :weather
end
