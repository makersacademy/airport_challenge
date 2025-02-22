
class Airport
    attr_reader :plane, :hanger, :capacity

    def initialize(capacity = 20, weather = rand(1..10))
        @capacity = capacity
        @hanger = []
        @weather = weather
    end
    
    def land(plane)
        raise 'weather is stormy - landing not safe' if @weather <= 1
        raise 'Airport full' if @hanger.length >= @capacity
        @hanger << plane
    end
    
    def takeOff(plane)
        raise 'weather is stormy - take off not safe' if @weather <= 1 
        raise 'Airport is empty' if @hanger == []
        @hanger.pop
    end
    
end

