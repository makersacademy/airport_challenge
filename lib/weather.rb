class Weather
    
    def clear
        @weather = true
    end
    
    def storm
        @weather = false
    end
    
    def weather?
        @weather
    end
    
end