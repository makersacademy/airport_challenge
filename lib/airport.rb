require_relative 'plane'
require_relative 'weather'

class Airport

  DEFAULT_CAPACITY = 5
  attr_reader :name, :landing_area, :airport_space

  def initialize(name = :Heathrow, airport_space = DEFAULT_CAPACITY)
    fail "You cannot create an airport with no space for planes!" if airport_space <= 0
    @name = name
    @airport_space = airport_space
    @landing_area = Array.new
  end

  def add_plane_to_airport(plane)
    fail "Not a plane!" unless plane.instance_of?(Plane)
    fail "Airport is full!" if (@landing_area.length == @airport_space)
    @landing_area.push(plane)
  end

  def show_planes
    @landing_area.each_with_index.collect { |plane, idx| "Gate Number #{idx + 1}: #{plane}" }
  end

  def plane_at_airport?(plane)
    fail "Not a plane!" unless plane.instance_of?(Plane)
    if @landing_area.include?(plane)
       "Plane is at Gate #{@landing_area.find_index(plane) + 1}"
    else
      "Plane is not at this airport"
    end
  end

  def accept_landing(plane, weather = Weather.new)
    fail "Could not check weather!" unless weather.instance_of?(Weather)
    fail "Weather is stormy!" unless weather.state == 1
    fail "Not a plane, please do not land!" unless plane.instance_of?(Plane)
    fail "Airport is full!" if (@landing_area.length == @airport_space)
    @landing_area.push(plane)
  end

  def take_off(gate_number, weather = Weather.new)
    fail "Could not check weather!" unless weather.instance_of?(Weather)
    fail "Weather is stormy!" unless weather.state == 1
    fail "Plane is not at this airport!" if (gate_number - 1) < 0 || (gate_number - 1) > (@landing_area.length - 1)
    @landing_area.delete_at(gate_number - 1).flight_status = true
  end

end
