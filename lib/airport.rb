require_relative 'plane'

class Airport

    attr_reader :all_planes, :capacity, :weather

    DEFAULT_CAPACITY = 50

    def initialize(capacity = DEFAULT_CAPACITY)
      @all_planes = []
      @capacity = capacity
      @weather = weather
    end

    def land(boeing)
      fail "Not able to land, plane has already landed" if boeing.plane_landed?
      fail "Too stormy to land the plane!" if weather == "Stormy"
      fail "Not able to land, airport has reached its capacity" if full?
      boeing.land_plane
      all_planes << boeing
    end

    def take_off(boeing)
      fail "Too stormy for the plane to take off!" if weather == "Stormy"
      all_planes.delete(boeing)
    end

    private

    def full?
      @all_planes.count >= @capacity
    end

    def stormy?
      rand(1..10) > 5
    end

end
