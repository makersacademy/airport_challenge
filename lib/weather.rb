class Weather 

    STORM_ODDS = 5

    def initialize(n=rand(100))
        @weather = n
    end

    def stormy?
        return true if weather <= STORM_ODDS
        return false
    end

    private
    attr_reader :weather

end