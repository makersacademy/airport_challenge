class Airport
    attr_accessor :airport_full, :airport_capacity, :weather_condition
    
    def initialize
        @airport_capacity = 5
        @airport_full = false
        @weather_condition = "sunny"
    end 

    def instruct_land
        fail 'No landing, the weather is stormy!' if @weather_condition == "stormy"
        fail 'Airport is full.' if @airport_full == true
    end

    def instruct_take_off
        fail 'No taking off, the weather is stormy!' if @weather_condition == "stormy"
        "Plane took off."
    end

end
