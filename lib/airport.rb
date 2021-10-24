require 'plane'

class Airport
    def initialize(capacity)
      @capacity = capacity
      @airstrip = []

    end 
    def land(plane)
        raise "cannot land its stormy" if stormy?
        raise "cannot land plane: airport full" if @airstrip.length >= @capacity
       
        @airstrip.push(plane)
        
    end 

   
    def take_off(plane)
        raise "Cant take off its stormy" if stormy?
    end 

    def stormy?
        rand(1..6) > 4
    end 
end 