class WeatherReporter
  def stormy?
    Kernel.rand(1..6) > 3
  end
end