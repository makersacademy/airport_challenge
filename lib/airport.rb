require '/Users/student/workshops/week3/airport_challenge/lib/plane.rb'

class Airport
  attr_accessor :storage
  attr_accessor :departed
  attr_accessor :condition
  attr_accessor :capacity
  DEFAULT_CONDITION = rand(1..10)
  DEFAULT_CAPACITY = 10

  def initialize(capacity = DEFAULT_CAPACITY)
    @storage = []
    @capacity = capacity
  end

  def land_plane(plane)
    if @condition == "sunny"
      unless full?
        @storage.push(plane)
      else
        raise_error 'Airport is at its maximum capacity, please find another airport!'
      end
    else
      raise_error 'There is a storm! Please find another airport to land in'
    end
  end

  def plane_take_off(plane)
    if @condition == "sunny"
     @departed = @storage.delete(plane)
     if @departed == plane
     puts "plane #{@departed} has departed"
     else
     raise_error "Plane has already departed!"
     end
    else
     raise 'There is a storm outside! wait till its sunny'
    end
  end

  def weather(condition = DEFAULT_CONDITION)
    if condition == 5
       @condition = "stormy"
    else
       @condition = "sunny"
    end
  end

  private

  def full?
    if
      storage.length >= @capacity
    end
  end
end

# airport = Airport.new
# airport.weather(3)
# airport.land_plane(tom = Plane.new)
# airport.land_plane(james = Plane.new)
# puts airport.storage
# airport.plane_take_off(james)
# airport.plane_take_off(james)
# airport.plane_take_off(james)
# airport.plane_take_off(james)
# airport.plane_take_off(james)
# puts airport.storage
