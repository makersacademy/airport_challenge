
class Airport

    Default_capacity = 15

    def initialize(capacity = Default_capacity)
      @capacity = capacity
      @planes = []
    end
  
#   def count_planes
#     @planes.count
#   end

  def land(plane)
    fail 'no landing space! airport full' if full?
    fail 'cannot land plane if weather stormy' if stormy?
    @planes << plane
  end

  def take_off(plane)
    fail 'cannot take off if weather stormy' if stormy?
  end

  def full?
    @planes.length >= @capacity
  end

  def stormy?
    rand(1..100) > 80
  end

#   def empty?
#     count_planes == 0
#   end

end



# land at airport

# plane takes off and confirms 
# its no longer in the airport

# safety if airport is full dont land

# default airport capacity can be overridden


# if storm prevent take off

# if storm prevent landing