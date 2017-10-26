require './lib/plane'

class Airport

  attr_reader :airport, :capacity
  CAPACITY = 20

  def initialize(capacity = CAPACITY)
    @airport = []
    @capacity = capacity
  end

  def land(plane)
    raise "Airport full" if full?
    plane.can_fly = weather_fine
    fail "Bad weather"  unless weather_fine
    if plane.can_fly
      @airport << plane
    end
  end

  def plane_take_off (weather_fine = true)
    raise "airport is empty" if empty?
    @airport.each do |plane|
      raise "Bad weather" unless weather_fine
      plane.can_fly = weather_fine
      if plane.can_fly
          @airport.delete(plane)
        return plane
      end
    end
  end



private

   def full?
     @airport.length == capacity
   end

   def empty?
     @airport.empty?
   end

   def weather_fine
        # rand(101) <= 50
     false
   end

end
