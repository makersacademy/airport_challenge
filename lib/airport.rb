class Airport
  attr_reader :planes

  def initialize(weather)
    @planes = []
    @weather = weather
  end

  def land_plane(plane)
    plane.land
    planes << plane if plane.landed?
  end

  def take_off(plane)
    raise 'Plane cannot take off in stormy weather!' if @weather.current_weather == :stormy
    raise 'The plane is not in the airport!' if !planes.include?(plane)
    plane.take_off
    planes.delete(plane)
  end
end