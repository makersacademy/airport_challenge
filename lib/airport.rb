class Airport

    attr_reader :plane

    DEFAULT_CAPACITY = 20

    def initialize
        @hangar = []
    end

    def land(plane)
        fail 'Airport is full' if full?
        @hangar << plane
    end

    def take_off(plane)
        @hangar.pop(plane)
    end

    private

    def full?
        @hangar.length >= DEFAULT_CAPACITY
    end

end