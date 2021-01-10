require_relative 'plane'

class Airport

  DEF_CAPACITY = 2

  def initialize(capacity = DEF_CAPACITY)
    @capacity = capacity
    @runway = []
  end

  def land(plane)
    if @runway.length == @capacity
      raise "Go away. Airport is full."
    else
      @runway << plane
    end
  end

  def take_off(plane)
    @runway.delete(plane)
    "#{plane} has buggered off."
  end

attr_reader :runway
attr_reader :capacity
end

# private
#   def full?
#     @runway.length == @capacity
#   end
#
# end
