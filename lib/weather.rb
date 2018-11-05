class Weather
  def initialize
    @weather = ['Sunny', 'Stormy']
    @default_weather = @weather[0]
  end

def check_weather
  if rand(100) >94
    return @weather[1]
  else
    return @default_weather
  end
end

end
