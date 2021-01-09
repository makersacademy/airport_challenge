class Airport
    attr_reader :full, :capacity

    DEFAULT_CAPACITY = 20

    def initialize(capacity=DEFAULT_CAPACITY)
        @full = true
        @capacity = capacity
    end
    def land
        fail 'Airport is full' if @full
        true
    end
    def take_off
        true
    end
end