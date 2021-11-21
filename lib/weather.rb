class Weather 
    def initialize(n=rand(100))
        @weather = n
    end

    def stormy?
        return true if weather < 5
    end

    private
    attr_reader :weather

end