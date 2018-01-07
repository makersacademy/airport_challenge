require './lib/weather'
require './lib/airport'
require './lib/controller'
require './lib/plane'

describe Controller do
  it "should be able to manage landing three planes" do

    # only 3 planes allowed in the airport
    airport = Airport.new(3)
    weather = Weather.new([:fine])
    planes = [Plane.new, Plane.new, Plane.new, Plane.new]
    controller = Controller.new(airport, weather, planes)

    # set up with 4 inbound planes
    expect(controller.planes_inbound.count).to eq 4
    expect(airport.planes_on_the_ground.count).to be 0

    # land 3 planes
    controller.issue_landing_instruction
    controller.issue_landing_instruction
    controller.issue_landing_instruction
    expect(controller.planes_inbound.count).to eq 1
    expect(airport.planes_on_the_ground.count).to be 3

    # try landing a fourth
    expect { controller.issue_landing_instruction }.to raise_error "Landing not possible at the moment"

    # get one to take off so that theres sapce for the last plane
    expect(controller.planes_outbound.count).to eq 0
    controller.issue_takeoff_instruction
    expect(controller.planes_outbound.count).to eq 1
    expect(airport.planes_on_the_ground.count).to be 2

    # land the last plane
    controller.issue_landing_instruction
    expect(controller.planes_inbound.count).to eq 0
    expect(airport.planes_on_the_ground.count).to be 3

    # get the three planes at the airport in to the air
    controller.issue_takeoff_instruction
    controller.issue_takeoff_instruction
    controller.issue_takeoff_instruction
    expect(controller.planes_outbound.count).to eq 4
    expect(airport.planes_on_the_ground.count).to be 0

    # try landing a fourth
    expect { controller.issue_takeoff_instruction }.to raise_error "Take off not possible at the moment"
  end
end
