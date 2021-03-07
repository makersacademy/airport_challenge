class Weather
  def weather_report
    @weather = rand(6)
      if @weather >=5
        "Stormy weather, airport closed."
      end
    end
  end
