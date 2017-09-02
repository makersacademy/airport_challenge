class Airport

  attr_accessor :planes, :landed

  def initialize
    #plane has no location when initialized
    @landed = nil
    @planes  = []
  end

  def land(plane)
    fail "You can't land this plane again!" if @landed == true
    @planes << plane
    @landed = true
  end

  def depart(plane)
    #You depart the plane
    #L
    fail "The plane has already departed" if @landed == false
    @planes.pop
    puts "Your plane has left the airport!"
    @landed = false
    #It has departed
  end
end

#What if there are multiple planes?
#Use an array --> multiple planes
