require_relative 'plane'


class Airport

  def initialize(capacity)
    @capacity = capacity
    @planes_in_airport = []
  end

  def land(plane)
    raise "airport is full, can't land plane" if full?
    # raise "weather is stormy, can't land plane" if stormy?
    @planes_in_airport << plane
  end

  def confirm_land(plane)

  end

  def take_off(plane)
#     raise "weather is stormy, can't take off" if stormy?
#     @planes_in_airport.pop
  end
#
  def confirm_take_off(plane)

  end
#   private
#
#   def stormy?
#     rand(1..10) > 3
#   end
#
   def full?
     @planes_in_airport.size >= @capacity ? true : false
   end

end
