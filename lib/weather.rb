module WeatherConditions

  class Weather

    def stormy?
      rand(1..10)
    end
    
    def good?
      stormy? < 6
    end

  end

end
