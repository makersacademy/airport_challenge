class Weather

  def forecast
    @forecast_generator = rand(1..5)
    if @forecast_generator == 5
      return :stormy
    else
      :sunny
    end
  end

end
