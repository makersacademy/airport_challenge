class Weather
WEATHER_SAMPLE = [:stormy, :sunny,:sunny,:sunny,:sunny,:sunny,:sunny]
attr_reader  :stormy
def weather
	@stormy = WEATHER_SAMPLE.sample
end
end