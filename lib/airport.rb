class Airport

  attr_accessor :planes, :landed, :weather

  def initialize(weather = Weather.new)
    #plane has no location when initialized

    @landed = nil
    @planes  = []
    @weather = Weather.new

  end


  def land(plane)
    fail "You can't land this plane again!" if @landed == true
    @planes << plane
    @landed = true
  end

  def depart(plane)

    fail "The plane has already departed" if @landed == false
    fail "The plane can't set off because it is stormy" if @weather.stormy?
    @planes.pop
    puts "Your plane has left the airport!"
    @landed = false
    end

  def full?
    true if @planes.count >= 1
  end
  end
