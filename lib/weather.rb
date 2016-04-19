class Weather

    attr_reader :weather

    def initialize
      @weather
    end

    def weather
     @weather = rand(10) > 8 ? true : false
    end
end