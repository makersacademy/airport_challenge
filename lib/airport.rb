class Airport
  attr_reader :planes, :capacity

  def initialize(capacity = 20)
    # @planes = []
    @capacity = capacity

  end

  def land(planes)
    fail 'Cannot land, airport full' if @planes.count >= @capacity
    
  end

  def take_off(planes)
    puts "No more planes in the airport"
  end


  # def stormy?
  #   fail "The weather is stormy!No landing or takeoff!" if @weather_conditions == "stormy"

  # end
end
