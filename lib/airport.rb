class Airport

  attr_accessor(:planes)

  def initialize
    @planes ||= []
  end

  def open?
    true
  end

  def land(plane)
    @planes << plane
  end

  def take_off(plane)
    @planes.delete(plane)
  end

# private
#
#   def full?
#     @planes.count >= @capacity
#   end

end
