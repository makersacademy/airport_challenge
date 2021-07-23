class Airport
attr_accessor :capacity

  def initialize(capacity)
    @capacity = capacity
    @planes= []
  end

  def landing(plane)
    fail 'No space to land' if full?

    fail 'Unsafe to land, bad weather' if weather?

    @planes << plane
  end

  def take_off(plane)
    # remove plane from array
    fail 'Unsafe to land, bad weather' if weather?
    @planes.pop 
  end

  def weather?
    weather = ["sunny", "sunny", "sunny", "sunny", "sunny", "sunny", "sunny"]
    return weather.sample
    rand(1..10) > 8
  end

  private 
  
  def full?
    true if @planes.length >= @capacity
  end
end
