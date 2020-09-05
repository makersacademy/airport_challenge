require 'weather'

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
        raise "Stormy weather cannot land" if @weather.is_stormy? == true
        @planes << plane
    end

    def take_off
        raise "There are no planes" if @planes.empty?
        @planes.pop
    end

    def set_stormy(state)
    @weather_state = state
    end

end