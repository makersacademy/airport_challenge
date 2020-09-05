class Airport
    DEFAULT_CAPACITY = 20
    attr_accessor :planes, :capacity

    def initialize
    @capacity = DEFAULT_CAPACITY
    @planes = []
    end


    def land(plane)
        raise "The airport is full" if @planes.length >= @capacity
        @planes << plane
    end

    def take_off
        raise "There are no planes" if @planes.empty?
        @planes.pop
    end

end