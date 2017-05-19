class Weather
  
  def sunny?
    change_weather_condition
    @current_weather_conditon == :sunny
  end

private

  def change_weather_condition
    if Kernel.rand(1...100) >= 85
      @current_weather_conditon = :stormy
    else
      @current_weather_conditon = :sunny
    end
  end
end
