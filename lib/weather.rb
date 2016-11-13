class Weather

attr_accessor :calm_or_stormy

def initialize(calm_or_stormy = "Calm")
@calm_or_stormy = ""
end

def report
weather_number = 1 + rand(10)
if weather_number == 10
  calm_or_stormy = "Stormy"
else
  calm_or_stormy = "Calm"
end
end
end
