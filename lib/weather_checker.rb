module WeatherChecker
attr_reader :weather

    def update_weather
      return @weather = "stormy" if Random.rand > 0.9
      @weather = "sunny"
    end

private
attr_writer :weather

end
