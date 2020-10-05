class Weather

  attr_reader :weather, :number

  WEATHER_NUM = rand(1..100)

  def initialize
    @number = WEATHER_NUM
    @weather = 'sunny' if (1..80).include?(@number)
    @weather = 'stormy' if (81..100).include?(@number)
  end

  def wet_weather?
    raise 'you cannot land here, the weather is too bad' if @weather == 'stormy'
  end

end
