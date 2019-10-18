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
    puts "Leaving #{@location} airport at #{Time.new}"
    @location = "in transit"
  end
end
