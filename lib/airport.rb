class Airport

  def initialize
    @planes = []
  end

  def land
    Plane.new
    fail 'Airport full, do not land' if @planes.count >= 5
    @planes.pop
    # creates a plane so it land at the airport
  end

  def take_off(plane)
    Plane.new
    fail 'No planes at the airport' unless @planes.empty?
    @planes << plane
  end
end
