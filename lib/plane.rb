class Plane

  attr_reader :flying, :location

  def initialize
    @flying = true
    @location = "in flight"
  end

  def land(destination)
    @flying = false
    @location = destination
    puts "Landed at London airport"
  end

  def take_off
    puts @location
  end

end
