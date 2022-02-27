require './lib/plane'

class Airport
  attr_reader :plane, :DEFAULT_CAPACITY

  def initialize(capacity = 30)
    @plane = []
    @DEFAULT_CAPACITY = capacity
  end

  def land(plane)
    # stormy?
    full?
    @plane << plane
  end

  def take_off
    # stormy?
    empty?
    return @plane.pop
  end

  private

#   def stormy?
#     if weather = "stormy"
#         raise Exception.new "Weather is stormy, cannot land or take off atm"
#     else 
#         true
#     end
#   end

  def full?
    if @plane.size > @DEFAULT_CAPACITY
      raise Exception.new "Airport is full"
    end    
  end

  def empty?
    if @plane.empty?
      raise Exception.new "No plane yet"
    end
  end

end