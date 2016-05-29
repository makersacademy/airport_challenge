class WeatherReport
  def stormy?
    rand(1..6) > 3
  end
end

# WeatherReport.new.stormy?
