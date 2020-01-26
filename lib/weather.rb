class Weather 

    def random_number
        rand 10
    end 

    def stormy?
        random_number >= 8
    end 
end 
