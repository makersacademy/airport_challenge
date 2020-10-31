module Weather
  class WeatherGenerator
    def weather
      outlooks.sample
    end

    private

    def outlooks
      sunnies = Array.new(19) { :sunny }
      stormies = Array.new(1) { :stormy }
      sunnies.concat(stormies).shuffle
    end
  end

  def self.current
    WeatherGenerator.new.weather
  end
end