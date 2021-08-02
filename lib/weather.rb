class Weather 

  def initialize
    @weather_report = :good_weather
  end
  
  def weather_report
    @weather_report = [:good_weather, :bad_weather].sample
  end
end
