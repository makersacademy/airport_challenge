class Plane

  attr_accessor :in_flight

  def initialize
    @in_flight = true
  end

  def land(airport, weather)
    fail 'Plane already landed' unless self.in_flight
    fail 'Airport full' if airport.full?
    fail 'Unsafe to land due to weather' if weather.stormy?
    airport.stored_planes.push(self)
    confirmation(airport)
    land_status
  end

  def flight_status
    self.in_flight = true
  end

  def land_status
    self.in_flight = false
  end

  private

  def confirmation(airport)
    puts "#{self} has landed at #{airport}"
  end

end
