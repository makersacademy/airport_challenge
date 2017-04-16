require_relative 'weather'
require_relative 'plane'

class Airport
  DEFAULT_CAPACITY = 20
  attr_reader :capacity, :planes, :weather

  def initialize(capacity = DEFAULT_CAPACITY)
    @weather = Weather.new
    @planes = []
    @capacity = capacity
  end

  def land(plane)
    fine_to_land?(plane)
    plane.land
    self.planes << plane
    puts "Successful landing!"
  end

  def take_off(plane)
    fine_to_take_off?(plane)
    plane.take_off
    planes.delete(plane)
    puts "Successful take-off!"
  end

  private

  def full?
    planes.count == capacity
  end

  def fine_to_land?(plane)
    fail 'Plane is not in flight' if plane.landed?
    fail 'Too stormy to land' if weather.stormy?
    fail 'Airport is too full to land' if full?
  end

  def fine_to_take_off?(plane)
    fail 'Plane is already in flight' unless plane.landed?
    fail 'Plane is not at given airport' unless planes.include?(plane)
    fail 'Too stormy to take off' if weather.stormy?
  end

end
