
class Airport 

  attr_reader :plane

    def initialize
      @plane = []
    end

    def land(boeing)
      @plane << boeing 
    end

    def take_off(boeing)
      @plane.delete(boeing)   
      @plane
    end 

end 
