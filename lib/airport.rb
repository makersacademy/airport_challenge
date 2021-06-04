class Airport
  attr_accessor :planes

  def initialize
    @planes = []
  end

  def land(plane)
    @planes << plane
  end

  def take_off(plane)
    @planes.pop
    @planes
  end

  #   def confirm_takeoff
  #     @planes.include?(plane)
  #   end
end

# airport = Airport.new
# airport.take_off("plane")
