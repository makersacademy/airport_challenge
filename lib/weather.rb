class Weather
    Weather_weighted = {
        sunny: 1.0,
        stormy: 0.0
    }
    def query
        Weather_weighted.max_by { |weather, weight| rand ** (1.0/ weight)}.first
    end
end
