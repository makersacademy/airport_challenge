class Weather

def weather_effect
  @weather_effect = 1 + rand(6)
  if @weather_effect <= 1
    @weather_effect = "stormy"
    @weather_effect
  else
    @weather_effect = "not stormy"
    @weather_effect
  end
end

end
