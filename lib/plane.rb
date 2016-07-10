require_relative 'weather'

class Plane
  def landed?(weather_report)
    @weather_report = weather_report
    "landed safely" if weather_report == "clear"
  end
end
