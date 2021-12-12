class Weather
  def forecast
    Kernel.rand(1..10) < 8 ? "Sunny" : "Stormy"
  end
end
