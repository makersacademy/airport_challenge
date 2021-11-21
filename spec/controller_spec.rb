require "controller"

describe Controller do

  it "The controller can request a landing" do
    controller = Controller.new
    expect(controller).to respond_to :request_landing
  end

  it "The controller can request a take-off" do
    controller = Controller.new
    expect(controller).to respond_to :request_take_off
  end

  it "The controller can request a plane lands at the airport" do
    controller = Controller.new
    plane = Plane.new
    controller.stub(:weather?).and_return("Clear")
    controller.request_landing(plane)
    expect(controller.airport.storage).to include(plane)
  end

  it "The controller can request a plane takes off at the airport" do
    controller = Controller.new
    plane = Plane.new
    plane.land
    controller.airport.storage << plane
    controller.stub(:weather?).and_return("Clear")
    controller.request_take_off(plane)
    expect(controller.airport.storage).not_to include(plane)
  end

  it "A plane the controller has requested land confirms it has landed" do
    controller = Controller.new
    plane = Plane.new
    controller.stub(:weather?).and_return("Clear")
    controller.request_landing(plane)
    expect(plane.in_air).to eq false
  end

  it "A plane the controller has requested take off confirms it has taken off" do
    controller = Controller.new
    plane = Plane.new
    plane.land
    controller.stub(:weather?).and_return("Clear")
    controller.airport.storage << plane
    controller.request_take_off(plane)
    expect(plane.in_air).to eq true
  end

  it "A plane cannot take off from an airport it is not at" do
    controller = Controller.new
    plane = Plane.new
    plane2 = Plane.new
    controller.airport.storage << plane2
    expect { controller.airport.plane_taking_off(plane) }.to raise_error("That plane isn't in this airport!")
  end

  it "A plane cannot land at a full airport" do
    controller = Controller.new
    controller.stub(:weather?).and_return("Clear")
    20.times { controller.request_landing(Plane.new) }
    plane = Plane.new
    expect { controller.request_landing(plane) }.to raise_error("The airport is full!")
  end

  it "The controller can create a new airport" do
    controller = Controller.new
    expect(controller).to respond_to :create_new_airport
  end

  it "The other airports are stored for usage" do
    controller = Controller.new
    controller.create_new_airport("JFK")
    expect(controller.other_airport_names).to include("JFK")
  end

  it "The controller can change the airport to another created one" do
    controller = Controller.new
    controller.create_new_airport("JFK")
    controller.change_airport_using("JFK")
    expect(controller.airport.name).to eq("JFK")
  end

  it "If the controller attempts to change to an non-created airport, an error is raised" do
    controller = Controller.new
    expect { controller.change_airport_using("JFK") }.to raise_error("That's not an airport I know!")
  end

  it "If the controller tries to create an airport twice, an error is raised" do
    controller = Controller.new
    controller.create_new_airport("JFK")
    expect { controller.create_new_airport("JFK") }.to raise_error("That airport exists!")
  end

  it "If the controller tries to create the same airport they are in, an error is raised" do
    controller = Controller.new
    expect { controller.create_new_airport("Heathrow") }.to raise_error("That airport exists!")
  end

  it "The controller can add a new plane in the sky" do
    controller = Controller.new
    controller.stub(:weather?).and_return("Clear")
    controller.new_plane_in_sky
    expect(controller.planes_in_sky).not_to be_empty

  end

  it "The controller can add a new plane in an airport" do
    controller = Controller.new
    controller.stub(:weather?).and_return("Clear")
    controller.new_plane_in_airport
    expect(controller.airport.storage).not_to be_empty
  end

  it "The controller has a list of all planes in the sky" do
    controller = Controller.new
    expect(controller.planes_in_sky).to be_instance_of(Array)
  end
end
