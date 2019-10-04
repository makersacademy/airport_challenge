require '/Users/student/projects/airport_challenge/lib/plane.rb'

class Airport

  attr_reader :planes, :capacity

  def initialize
    @capacity = 20
    @planes = []
    @weather_stormy = false
  end

  def add_plane(plane)
    fail 'weather is too stormy for landing' if weather_stormy?
    fail 'airport is full so plane cannot land' if full?
    @planes << plane
  end

  def remove_plane(plane)
    fail 'weather is too stormy for take off' if weather_stormy?
    @planes.delete(plane)
  end

  def weather_is_stormy
    @weather_stormy = true
  end

  private

  def weather_stormy?
    @weather_stormy
  end

  def full?
    planes.count == capacity
  end

end
