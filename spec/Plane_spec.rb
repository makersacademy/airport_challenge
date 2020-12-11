require 'Plane'

describe Plane do
  let(:plane) { Plane.new }
  let(:controller) { TrafficController.new }

  it "each plane has a unique ID" do
    plane_ids = []
    10.times { plane_ids << Plane.new.object_id }
    # Create 10 planes and push their ids onto the array
    num_of_repeated_ids = plane_ids.count(plane_ids[0])
    # Count how many of the first ID in the list are in the array
    # Should be one
    expect(num_of_repeated_ids).to eq 1 
  end

  it "successful landing" do
    controller.override_weather("clear")
    expect { plane.land(controller) }.to output("Successful landing\n").to_stdout
  end

  it "unsuccessful landing" do
    controller.override_weather("stormy")
    expect { plane.land(controller) }.to output("Could not land\n").to_stdout
  end

  it "unsuccessful take off" do
    controller.override_weather("stormy")
    expect { plane.take_off(controller) }.to output("Could not take off\n").to_stdout
  end

  it "successful take off" do
    controller.override_weather("clear")
    expect do
      plane.land(controller)
      plane.take_off(controller)
    end.to output("Successful landing\nSuccessful take off\n").to_stdout
  end

end
