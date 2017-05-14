require_relative 'plane'
require_relative 'weather'

class Airport
  
  DEFAULT_CAPACITY = 20

  attr_reader :planes
  attr_accessor :capacity, :sunny

  def initialize capacity = DEFAULT_CAPACITY
    @planes = []
    @capacity = capacity
    condition = Weather.new
    @weather = condition.sunny
  end

  def take_off plane
    fail 'Weather stormy! Cannot take off!' unless sunny
    fail 'Plane not at airport!' unless plane.landed
    return plane if check_plane(plane) == plane
    fail 'Plane is not at this airport'
  end
 
  def land plane
    fail 'Airport full!' if full?
    fail 'Weather Stormy cannot land' unless sunny
    fail 'Plane already landed!' if plane.landed
    plane.landed = true
    planes << plane
  end

  private

  def full?
    @planes.count >= capacity
  end


  def check_plane(plane)
    planes.each_with_index do |check, index|
      next unless check == plane
      planes.delete_at(index)
      plane.landed = false
      return plane
    end
  end

end

p airport = Airport.new
p plane = Plane.new
# p airport.sunny = true
p airport.land(plane)
p airport.take_off(plane)

