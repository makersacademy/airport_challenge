class Weather
    
    attr_reader :whats_the_weather
    
    def initialize
        @weather    
    end
    
    def whats_the_weather
        @weather = ['sunny', 'stormy'].shuffle.sample
        return @weather  
    end
    
    
end