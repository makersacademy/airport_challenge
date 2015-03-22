
# Idea: lanes
class Airport
  attr_reader :weather, :planes, :checked_in_passengers, :flights
  attr_accessor :capacity

  DEFAULT_CAPACITY = 20

  def initialize capacity = DEFAULT_CAPACITY
    @weather = %w(sunny stormy).shuffle[0]
    @planes = []
    @capacity = capacity
    @checked_in_passengers = []
    @flights = []
  end

  def land_plane plane
    fail 'Can not land, bad weather' if weather == 'stormy'
    fail 'Airport full' if planes.length == capacity
    plane.land
    planes.push(plane)
  end

  def initialize_take_off plane
    fail 'Can not take off, bad weather' if weather == 'stormy'
    plane.take_off
    planes.delete(plane)
  end

  def add_flight flight
    flights.push(flight)
  end

  def check_in passenger, flight
    fail 'Already checked in' if checked_in_passengers.include?(passenger)
    fail 'Flight not available' if flights.include?(flight) == false
    checked_in_passengers.push(passenger)
  end

  def check_out passenger
    checked_in_passengers.delete(passenger)
  end
end
