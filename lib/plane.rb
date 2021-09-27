class Plane
    def initialize(landed = nil)
      @landed = landed
    end
  
    def plane_landed
      @landed == landed
    end
  
    def plane_flying
      @landed == flying
    end
  end