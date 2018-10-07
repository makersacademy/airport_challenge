class Plane

  def initialize(good_weather=true)
    @good_weather = good_weather
  end

  def good_weather?
    @good_weather
  end

  def report_bad_weather
    @good_weather = false
  end
end
