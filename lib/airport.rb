require_relative 'weather'
require_relative 'plane'

class Airport
    DEFAULT_CAPACITY = 20
    attr_accessor :planes, :capacity, :weather

    def initialize(capacity=DEFAULT_CAPACITY)
    @capacity = capacity
    @planes = []
    @weather = Weather.new
    end


    def land(plane)
        raise "The airport is full" if @planes.length >= @capacity
        raise "Plane is landed" if plane.flying? == false
        raise "Stormy weather cannot land" if @weather.is_stormy? == true
        plane.land
        @planes << plane
    end

    def take_off
        raise "Plane is flying" if plane.flying? == true
        raise "There are no planes" if @planes.empty?
        plane.takeoff
        @planes.pop
    end



end