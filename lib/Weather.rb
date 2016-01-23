class Weather
  def initialize
    num = rand(1..20)
    num == 15 ? @bad_weather = true : @bad_weather = false
  end

  def is_bad?
    @bad_weather
  end

end
