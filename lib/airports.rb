require "airplanes"
class Airport
    attr_reader :planes, :capacity
    attr_accessor :weather
    def initialize(capacity = 20)
    @capacity = capacity
    @planes = []
    @weather = self.forecast
    end
    def land(plane)
        fail "Plane is already landed at a different station" unless plane.location == "Sky"
        fail "Cannot land due to adverse weather conditions" unless self.clear?
        fail "Airport is at capacity" if self.full?
        plane.location = self
        @planes.push(plane)
    end
    def take_off
        fail "Cannot take off due to adverse weather conditions" unless self.clear?
        @planes.last.location = "Sky"
        @planes.pop
    end 
    def full? 
        if @planes.length > @capacity 
            return true
        else 
            return false
        end
    end
    def clear?
        if @weather == "Stormy"
            return false
        else
            return true
        end
    end
    def forecast
        random = rand(1..10)
        if random == 10
          @weather = "Stormy" 
        else
          @weather = "Sunny"
        end
    end

end
