class Airport
    attr_reader :full

    def initialize
        @full = true
    end
    def land
        fail 'Airport is full' if @full
        true
    end
    def take_off
        true
    end
end