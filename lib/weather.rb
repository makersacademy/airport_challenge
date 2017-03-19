class Weather

    def generate_weather
      number = Random.new.rand(0..10)
      number == 1 ? "Stormy" : "Sunny"
    end
    
end
