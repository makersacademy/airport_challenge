class LHRairport
  def initialize
    @airplanes = []

    def land_plane(airplane)
      fail 'Airport is full' if full?
      @airplanes << airplane
    end
end
    def depart_plane
      Airplane.new
    end
    def full?
      @airplanes.count >= 10
    end
end
