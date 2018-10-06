class Weather

  def initialize(weather = ['sunny', 'stormy'])
    @weather = weather
  end

  def weather_conditions
    case rand(100) + 1
      when  1..80   then 'sunny'
      when 80..100   then 'stormy'
    end
  end
end
