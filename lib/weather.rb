class Weather
  
    def stormy?
      weather_spin == "stormy"
    end

    private

    def weather_spin
      ["stormy", "Blue Skies", "Blue Skies", "Blue Skies"].sample
    end
end