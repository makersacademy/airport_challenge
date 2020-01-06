class Weather
    
    # attr_reader :good

    def initialize
        rand(10) == 0 ? @good = false : @good = true
    end
    
    def good?
        @good
    end

end