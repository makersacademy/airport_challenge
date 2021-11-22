class Airport
    attr_reader :planes
    def initialize
      @planes = []
      @weather = check_weather
    end