class Airport
  attr_reader :planes
  attr_writer :planes

  def initialize
    @planes = []
    plane1 = Plane.new
    @planes << plane1
    @weather = rand(1..2)
    if @weather == 2
      @weather = "stormy"
    else
      @weather = "sunny"
    end
  end

  def land(plane)
    fail "Warning: Too many planes at airport" unless planes.count == 0
    @planes << plane
  end

  def takeoff(plane)
    fail "Warning: Weather is too stormy to depart" unless @weather == "sunny"
    @planes.pop
    return @planes
    puts "Plane has left the airport."
  end
end
