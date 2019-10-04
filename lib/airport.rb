require '/Users/student/projects/airport_challenge/lib/plane.rb'

class Airport

  attr_reader :planes

  def initialize
    @planes = []
    @weather_stormy = false
  end

  def add_plane(plane)
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
end
