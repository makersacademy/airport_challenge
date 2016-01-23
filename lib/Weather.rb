class Weather
  def initialize
    num = rand(1..20)
    if num == 15
      @bad_weather = true
    else
      @bad_weather = false
    end
  end

  def is_bad?
    @bad_weather
  end

end
