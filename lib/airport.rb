class Airport

  attr_accessor :planes, :landed, :weather

  def initialize(weather = Weather.new)
    @landed = nil
    @planes  = []
    @weather = Weather.new
  end


  def land(plane)
    @planes << plane
    fail "You can't land this plane again!" if @planes.detect{ |e| @planes.count(e) > 1 }
    @landed = true
  end

  def depart(plane)
    fail "The plane can't set off because it is stormy" if @weather.stormy?
    fail "The plane has already departed" if @landed == false
    @planes.pop
    puts "Your plane has left the airport!"
    @landed = false
  end

  def full?
    true if @planes.count >= 10
  end

end
