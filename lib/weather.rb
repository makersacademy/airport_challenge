class Weather

    attr_reader :conditions
    
    def generate_current_conditions
        rand(4) == 1 ? "Stormy" : "Calm"
    end    

    def current_conditions_safe? 
        @conditions = generate_current_conditions
        @conditions == "Calm" ? true : false
    end 

end