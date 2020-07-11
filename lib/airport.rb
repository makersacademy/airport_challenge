require_relative 'plane'

class Airport
    attr_reader :capacity

    DEFAULT_CAPACITY = 100

    def initialize(capacity=DEFAULT_CAPACITY)
        @capacity = capacity
    end

    def full?
    end

    def stormy?
    end

end