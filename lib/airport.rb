require_relative 'plane'

class Airport 

    DEFAULT_CAPACITY = 100

    attr_reader :capacity 

    def initialize(capacity=DEFAULT_CAPACITY)
        @plane = []
        @capacity = capacity
    end 

    # def get_plane(plane)
    #     @plane << plane 
    # end 

    def land(plane)
        fail 'Airport is full' if full_airport
        @plane << plane 
    end 

    def take_off(plane)
        fail 'Weather is stormy, plane cannot take off' if weather == 'stormy'
        @plane.pop # removes the last element of the array 
    end 

    def plane_gone
        @plane.empty? 
    end 

    def weather
        todays_weather = ['sunny','rain','cloudy','stormy'].sample 

    end 


    private 

    attr_reader :plane 
    

    def full_airport
        @plane.count >= capacity
    end 


end 