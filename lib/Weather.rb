class Weather
  def initialize
    num = rand(1..40)
    num == 15 ? @bad_weather = true : @bad_weather = false
  end

  def bad?
    @bad_weather
  end

end
