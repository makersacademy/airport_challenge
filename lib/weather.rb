class Weather
    Weather_weighted = {
        sunny: 0.9,
        stormy: 0.1
    }
    def types
        Weather_weighted.keys
    end
    def query
        Weather_weighted.max_by { |weather, weight| rand ** (1.0/ weight)}.first
    end
end
