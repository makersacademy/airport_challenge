
class Airport 

  attr_reader :plane
  attr_reader :capacity

    def initialize(planes = [], capacity = 1)
      @plane = planes
      @capacity = capacity
    end

    def land(boeing)
      fail "Airport at capacity" if @plane.length > (@capacity - 1)
      @plane << boeing
    end

    def take_off(boeing, weather)
      fail "Weather is stormy" if weather > 7
      # p @plane
      # p boeing
      # p (@plane.include? boeing)
      fail "This plane is not at this airport" unless (@plane.include? boeing)
      @plane.delete(boeing)   
      p @plane
    end 

end 
