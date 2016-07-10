require_relative 'weather'

class Plane

  def safe_to_land?(weather_report)
    @weather_report = "stormy"
  end

  def landed?
    #@weather_report
    #"landed safely" if weather_report == "clear"
  end
end
