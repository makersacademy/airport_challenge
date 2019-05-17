class Airport
    attr_reader :plane
    attr_accessor :hangar

    def initialize 
      @hangar = []  
    end

    def land(plane)
      @plane = plane
    end

    def take_off(plane)
      @hangar << plane
    end


  end