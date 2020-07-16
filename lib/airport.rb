require_relative 'plane'

class Airport
  attr_reader :plane

  def initialize(capacity)
    @capacity = capacity
    @planes_at_airport = 0
  end


  def land(plane)
     raise 'Airport full' if @planes_at_airport >= @capacity
     @planes_at_airport += 1
     puts @planes_at_airport
   end

  def take_off(plane)
    #{@plane} has taken off"
  end

  def capacity(number)
    @capacity = number
  end

end
