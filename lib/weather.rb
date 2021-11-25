class Weather
    attr_reader :stormy
    def initialize
      @stormy = rand(10)
    end

    def safe_to_fly?
        @stormy < 7
    end
end
