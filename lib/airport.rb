class Airport

    attr_reader :all_planes

    def initialize
      @all_planes = []
    end

    def land(boeing)
      boeing.land_plane
      all_planes << boeing
    end

    def take_off(boeing)
      boeing.take_off_plane
      all_planes.delete(boeing)
    end



end
