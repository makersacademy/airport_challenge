class Airport

    attr_reader :hanger
    attr_accessor :hanger_capacity

    def initialize(hanger_capacity=1)
        @hanger = []
        @hanger_capacity = hanger_capacity
    end

    def land(plane)
        fail 'Airport is full' if @hanger.length >= @hanger_capacity
        @hanger.push(plane)
    end

    def takeoff(plane)
        @hanger.delete(plane)
    end

end