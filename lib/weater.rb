class Weather

    def stormy?
      stormy_weather == :stormy
    end

    def sunny?
      sunny_weather == :sunny
    end

    private

    CONDITIONS = [:stormy, :sunny, :sunny, :sunny]

    def stormy_weather
      CONDITIONS.sample
    end


end
