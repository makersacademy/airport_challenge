class Weather
    def state
        number = rand(5)
        number == 4 ? "stormy" : "sunny"
    end
end