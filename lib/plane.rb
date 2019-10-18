
class Plane
  attr_reader :grounded

  def initialize
    @grounded = true
  end

  def land(airport, weather)
    puts @grounded
    if @grounded == false
      if weather.status == "Sunny"
        if airport.plane_capacity.length < airport.max_capacity
          @grounded = true
          airport.plane_capacity << self      
        else
          raise "No space available"
        end
      else
        raise "Weather is stormy"
      end
    else
      raise "Plane already landed"
    end
  end

  def take_off(airport,weather)
    if @grounded == true
      if weather.status == "Sunny"
        @grounded = false
        airport.plane_capacity.delete(self)
      else
        raise "Weather is stormy"
      end
    else
      raise "Plane already taken off"
    end
  end
end
