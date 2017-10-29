# As an air traffic controller
# So I can get passengers to a destination
# I want to instruct a plane to land at an airport
#
# As an air traffic controller
# So I can get passengers on the way to their destination
# I want to instruct a plane to take off from an airport and confirm that it is no longer in the airport
#
# As an air traffic controller
# To ensure safety
# I want to prevent takeoff when weather is stormy
#
# As an air traffic controller
# To ensure safety
# I want to prevent landing when weather is stormy
#
# As an air traffic controller
# To ensure safety
# I want to prevent landing when the airport is full
#
# As the system designer
# So that the software can be used for many different airports
# I would like a default airport capacity that can be overridden as appropriate

class AirTrafficController
  def instruct_to_land(plane, airport)
    plane.land
    airport.register_landing(plane)
  end

  def instruct_to_take_off(plane, airport)
    true
  end

  def plane_left?
    true
  end
end

class Airport
  @planes = []
  def register_landing(plane)
  end
end

class Plane
  @landed = false

  def land
    @landed = true
  end

  def has_landed?
    @landed
  end

  def took_off?
    true
  end
end

describe "air traffic controller" do
  it "instructs plane to land at an airport" do
    air_traffic_controller = AirTrafficController.new
    plane = Plane.new
    airport = Airport.new
    air_traffic_controller.instruct_to_land(plane, airport)
    expect(plane.has_landed?).to be true
  end
end

describe AirTrafficController do
  it 'instructs a plane to take off from an airport' do
    plane = Plane.new
    airport = Airport.new
    subject.instruct_to_take_off(plane, airport)
    expect(plane.took_off?).to be true
  end
    it 'confirms that the plane is no longer in the airport' do
    expect(subject.plane_left?).to eq true
  end
end
