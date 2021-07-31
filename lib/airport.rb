
class Airport 

  attr_reader :plane

    def initialize
      @plane = []
    end

    def land(boeing)
      @plane << boeing 
    end

    def take_off
      @plane.pop 
      @plane
    end 

end 
