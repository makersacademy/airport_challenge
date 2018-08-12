class Weather

    attr_reader :conditions_safe

    def conditions_safe?
        rand(5) == 1 ? false : true 
    end 

end