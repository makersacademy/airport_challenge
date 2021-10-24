class Airport

    def initialize(capacity)
      @capacity = capacity
      @planes = []
    end

    def land(plane)
        raise 'Can not land - full capacity!' if @planes.length >= @capacity
        raise 'Can not land plane in a storm' if stormy? true
        @planes << plane
    end

    def take_off(plane)
    end

    private

    def stormy?
        rand(1..10) > 7
    end

end