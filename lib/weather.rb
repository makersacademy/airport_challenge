require "./lib/plane"
require "./lib/airport"

class Weather

    attr_reader :conditions

    def initialize
        @conditions = current_conditions
    end

    def current_conditions
        @conditions = risk_of_rain ? "stormy" : "clear"        
    end

    def risk_of_rain
        rand(100) > 95
    end

end
