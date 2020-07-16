class Weather
  def weather_status
    if Kernel.rand(4) == 1
      "Stormy"
    else
      "Sunny"
    end
  end
end
