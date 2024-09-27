require './lib/Plane'
class Airport
    attr_reader :airport
    def initialize(capacity = 20)
      @airport = []
      @capacity = capacity
    end
    def land(plane = Plane.new )
      raise "Airport is full" if full? == true
      @airport.push(plane)
    end
    def take_off(plane = Plane.new)
      @airport.delete(plane)
    end
    def full?
      if @airport.count >= @capacity
        return true
      else
        return false
      end
    end
  end