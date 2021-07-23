class Airport
  attr_accessor :capacity
  attr_reader :planes

  def initialize(capacity)
    @capacity = capacity
    @planes = []
  end

  def landing(plane)
    fail 'No space to land' if full?
    fail 'Unsafe to land, bad weather' if weather?

    @planes << plane
  end

  def take_off(plane)
    fail 'Unsafe to land, bad weather' if weather?
    return plane
    @planes.delete(plane) 
  end

  private 
  
  def full?
    @planes.length >= @capacity
  end

  def weather?
    rand(1..10) > 8
  end
end
