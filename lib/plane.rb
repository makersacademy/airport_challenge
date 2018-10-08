class Plane
  @destination
  @in_flight
  attr_reader :in_flight
  def initialize(in_flight)
    @in_flight = in_flight
  end
  def receive_target(destination)
    @destination = destination
    "Thanks control, target destination is #{@destination}" 
  end
  def take_off
    @in_flight = true
  end
  def successful_take_off?
    @in_flight
  end
  def coming_in_to_land
    puts "Coming in for a landing"
    @in_flight = false
    true
  end
end