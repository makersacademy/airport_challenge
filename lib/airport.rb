class Airport
  attr_reader :planes, :capacity

  def initialize(capacity = 20)
    @planes = []
    @capacity = capacity

  end

  def land(plane)
    fail 'Cannot land, airport full' if full?
    @planes << plane

  end

  def take_off(plane)
    puts "No more planes in the airport"
  end

  private
  
  def full?
    @planes.length >= @capacity
  end
  # def stormy?
  #   fail "The weather is stormy!No landing or takeoff!" if @weather_conditions == "stormy"

  # end
end
