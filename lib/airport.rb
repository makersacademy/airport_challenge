class Airport
    DEFAULT_CAPACITY = 20
    attr_accessor :planes, :capacity, :weather

    def initialize(capacity=DEFAULT_CAPACITY)
    @capacity = capacity
    @planes = []
    @weather = weather
    end


    def land(plane)
        raise "The airport is full" if @planes.length >= @capacity
        raise "Stormy weather cannot land"
        @planes << plane
    end

    def take_off
        raise "There are no planes" if @planes.empty?
        @planes.pop
    end

end