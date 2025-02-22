require 'weather'

class Airport
    
    DEFAULT_CAPACITY = 20
    
    def initialize(capacity = DEFAULT_CAPACITY)
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
      raise 'Plane not at the airport!' unless @planes.include?(plane)
    end


private
    def stormy?
        WeatherStatus.new.stormy?
    end

end