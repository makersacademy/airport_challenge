class Weather

  def initialize
    @weather = 'sunny'
  end

  def weather_randomiser
    case rand(1..10)
    when 1..8 then @weather = 'sunny'
    when 9..10 then @weather = 'stormy'
    end
  end

  def stormy?
    weather_randomiser
    @weather == 'stormy'
  end
end
