class Airport
    DEFAULT_CAPACITY = 100

    attr_reader :capacity

    def initialize(capacity=DEFAULT_CAPACITY)
        @capacity = capacity
    end

    def is_full?
        true
    end
end