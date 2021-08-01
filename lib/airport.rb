
class Airport 

  attr_reader :plane

    def initialize(planes = [], capacity = 1)
      @plane = planes
      @capacity = capacity
    end

    def land(boeing)
      fail "Airport at capacity" if @plane.length > (@capacity - 1)
      @plane << boeing
    end

    def take_off(boeing, weather = clear)
      fail "Weather is stormy" if weather == "stormy"
      @plane.delete(boeing)   
      @plane
    end 

end 
