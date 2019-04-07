module WeatherConditions

  class Weather

    def stormy?
      rand(1..10)
    end
    
    def bad?
      stormy? > 6
    end

  end

end
