require_relative 'plane'
require_relative 'weather'

class Airport

  DEFAULT_CAPACITY = 5
  attr_reader :name, :landing_area, :airport_space

  def initialize(name = "Heathrow", airport_space = DEFAULT_CAPACITY)
    @name = name
    @airport_space = airport_space
    @landing_area = Array.new
  end

  def show_planes
    @landing_area.map { |plane| return "Plane #{plane.plane_number}" }
  end

  def accept_landing(plane, weather = Weather.new)
    fail "Could not check weather!" unless weather.instance_of?(Weather)
    fail "Weather is stormy!" unless weather.state == 1
    fail "Not a plane, please do not land!" unless plane.instance_of?(Plane)
    fail "Airport is full!" if (@landing_area.length == @airport_space)
    @landing_area.push(plane)
  end

  def take_off(plane, weather = Weather.new)
    fail "Could not check weather!" unless weather.instance_of?(Weather)
    fail "Weather is stormy!" unless weather.state == 1
    fail "Plane is not at this airport!" unless @landing_area.all? { |landed_plane| landed_plane.plane_number == plane.plane_number }
    plane_position = @landing_area.find_index(plane)
    @landing_area.delete_at(plane_position)
  end

end
