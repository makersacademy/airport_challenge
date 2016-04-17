class Weather
  attr_accessor :weather_now
  attr_reader :weather_states

    def initialize
      @weather_states = ['stormy', 'sunny', 'sunny', 'sunny']
      @weather_now = weather_states.sample
    end

end
