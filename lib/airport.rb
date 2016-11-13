class Airport

  attr_accessor :weather
  attr_accessor :capacity
  attr_accessor :airport
  attr_accessor :plane
  Capacity = 10

    def initialize(capacity = Capacity)
      @capacity = capacity
      @weather = "sunny"
      @airport = []
    end
    
    def set_weather(new_weather)
      @weather = new_weather
    end

    def get_weather
      @weather
    end

    def is_ok_to_take_off?
      if @weather == "sunny"
        true
      end
    end

    def is_ok_to_land?
      if @weather == "sunny"
        true
      end
    end

    def is_full?
      if @airport.count >= Capacity
        true
      else
        false
      end
    end
end
