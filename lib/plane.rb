class Plane

  attr_reader :flying, :location

  def initialize
    @flying = false
    @location = "initialized"
  end

  def land(destination)
    @flying = false
    @location = destination
    puts "Landed at London airport"
  end

  def take_off
    @flying = true
    @location = "in flight"
    puts "The plane has left the airport."
  end

end
