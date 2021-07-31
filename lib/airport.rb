
class Airport 

  attr_reader :plane

    def initialize(planes = [])
      @plane = planes
    end

    def land(boeing)
      fail "Airport at capacity" if @plane.length > 4
      @plane << boeing
    end

    def take_off(boeing)
      @plane.delete(boeing)   
      @plane
    end 

end 
