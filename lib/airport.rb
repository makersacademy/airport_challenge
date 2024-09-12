
class Airport
  DEFAULT_CAPACITY = 3
  attr_accessor :capacity, :plane, :airport
  def initialize(capacity = DEFAULT_CAPACITY)
    @capacity = capacity
    @airport = []
  end

  def landing(plane)
    fail 'airport full' if full?
    @airport << plane
  end

  def takeoff
    fail 'unable to takeoff' if empty?
    return "Taken off"
  end

  private
    def full?
      @airport.count >= DEFAULT_CAPACITY
    end

    def empty?
      @airport.empty?
    end

end
