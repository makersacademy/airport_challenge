require 'weather'

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
      raise 'Can not take-off in a storm' if stormy? true
    end

    private

    def stormy?
        WeatherStatus.stormy?
    end

end