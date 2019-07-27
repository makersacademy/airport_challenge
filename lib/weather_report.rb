class WeatherReport
  def stormy?
    Kernel.rand(1...7) == 1
  end
end