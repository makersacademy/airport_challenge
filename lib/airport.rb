require_relative 'plane'

class Airport 

    DEFAULT_CAPACITY = 100

    attr_reader :capacity 

    def initialize(capacity=DEFAULT_CAPACITY)
        @plane = []
        @capacity = capacity
    end 

    def land(plane)
        fail 'Airport is full' if full_airport
        raise 'weather is stormy, plane cannot land' if stormy_weather?
        @plane << plane 
    end 

    def take_off(plane)
        raise 'weather is stormy, plane cannot take off' if stormy_weather?
        @plane.pop 
    end 

    def plane_gone
        @plane.empty?
    end
    

    # def weather
    #     todays_weather = ['sunny','raining','cloudy','stormy'].sample 

    # end 

    private 

    attr_reader :plane 

    def full_airport
        @plane.count >= capacity
    end 

    def stormy_weather?
        rand(1..6) > 4 # creating storm 
    end 

end 