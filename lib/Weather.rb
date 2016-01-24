class Weather
  def initialize
    num = rand(1..20)
    num == 15 ? @bad_weather = false : @bad_weather = true
  end

  def bad?
    @bad_weather
  end

end
