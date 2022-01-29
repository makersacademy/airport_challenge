
class Plane

attr_accessor :flying

    def initialize
      @flying = true
    end

    def landed_plane
      @flying = false
    end

    def starts_flying
      @flying = true
    end

end