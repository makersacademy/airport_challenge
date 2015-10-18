class Plane

  attr_accessor :flying

    def initialize (flying = false)
      @flying = flying
    end

    def flying(fly_status = true)
      @flying = fly_status
    end

end
