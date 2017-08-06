class Weather
# Naming convention of instances: DAT_TIME e.g. AUG5_1700
attr_reader :weather_now

def initialize
  @weather_now=self.check_weather
end

  def check_weather
    now=rand(0..2)
    if now == 0
      weather="stormy"
    else
      weather="sunny"
    end
  weather
  end
end
