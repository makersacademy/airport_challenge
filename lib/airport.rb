require_relative 'plane'
class Airport
  def initialize(capacity = 3)
    @capacity = capacity
    @terminal = [] #empty terminal
  end

  def land(plane)
    fail 'Weather is bad for landing' if @weather == 'bad'
    @terminal << plane
    @terminal[-1]
  end

  def takeoff(plane)
    fail 'Weather is bad for taking off' if @weather == 'bad'
    x = @terminal.pop
    @terminal.delete(self)
    return x
  end

  def weatherquality
    @weather = ['bad','good'].sample
  end

  attr_reader :terminal
end






# require_relative 'plane'
# class Airport
#   DEFAULT_CAPACITY = 10
#   attr_reader = :array_of_planes, :capacity
#
#   def initialize(capacity=DEFAULT_CAPACITY)
#     @array_of_planes = []
#     @capacity = capacity
#   end
#
#   def land(plane)
#     fail 'Capacity has been reached' if full?
#     @array_of_planes.push(plane)
#     @array_of_planes[@array_of_planes.length - 1]
#     fail 'Weather is bad'
#   end
#
#   def takeoff
#     @array_of_planes.pop
#   end
#
#   private
#   def full?
#     @array_of_planes.count >= @capacity
#   end
#   def weather_is_good?
#     true
#   end
# end
