require 'plane'

class Airport
    def initialize(capacity)
      @capacity = capacity
      @airstrip = []

    end 
    def land(plane)
        raise "cannot land plane: airport full" if @airstrip.length >= @capacity
        @airstrip.push(plane)
        
    end 
    def take_off(plane)
    end 
end 