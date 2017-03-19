class Airport

    attr_reader :all_planes, :capacity

    DEFAULT_CAPACITY = 10

    def initialize
      @all_planes = []
      @capacity = DEFAULT_CAPACITY
    end

    def land(boeing)
      boeing.land_plane
      all_planes << boeing
    end

    def take_off(boeing)
      boeing.take_off_plane
      all_planes.delete(boeing)
    end

    def full?
      all_planes.count >= capacity
    end

end
