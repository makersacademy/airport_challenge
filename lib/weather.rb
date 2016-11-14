module Weather
    def weather_today
      random_generator = rand(10)
        if random_generator < 8
          return "Sunny"
        else
          return "Stormy"
        end
    end

end #
