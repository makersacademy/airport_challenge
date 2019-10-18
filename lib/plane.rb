class Plane
  attr_reader :flying, :location

  def initialize
    @flying = false
    @location = "Factory"
  end

  def land(destination)
    @flying = false
    @location = destination
    puts "Landed at #{destination} airport at #{Time.new}"
  end

  def takeoff
    @flying = true
    @location = "in transit"
  end
end
