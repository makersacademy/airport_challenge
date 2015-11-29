class Airport

  def land(plane)
  end

end




# require_relative "plane.rb"
#
# class Airport
#   DEFAULT_CAPACITY = 20
#
#   attr_reader :planes, :capacity
#
#   def initialize (capacity = DEFAULT_CAPACITY)
#     stormy?
#     @capacity = (capacity)
#     @planes = []
#   end
#
#   def land(plane)
#     raise "Sorry mate- storm's a brewin" if stormy
#     raise "Sorry mate- this airport is full..." if full?
#     @planes << plane
#   end
#
#   def take_off(plane)
#     raise "Sorry mate- storm's a brewin" if stormy
#     @planes.delete(plane)
#   end
#
#   private
#
#   def full?
#     true if @planes.length >= @capacity
#   end
#
#   def stormy?
#     if rand(9) < 2
#       @stormy = true
#     else
#        @stormy = false
#     end
#   end
#
# end
