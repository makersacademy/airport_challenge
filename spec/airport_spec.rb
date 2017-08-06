require 'airport'

describe Airport do
  airport = Airport.new(:LHR, 50)
  let(:grounded_plane) { double :grounded_plane }
  let(:flying_plane) { double :flying_plane }

  it "has a default capacity of 100?" do
    expect(airport.capacity).to eq 100
  end

  it "is instantiated with a given number of planes" do
    expect(airport.planes).to eq 50
  end

  it "stores an array of planes" do
    expect(airport.plane_list[0..49].all? { |plane| plane.is_a? Plane }).to eq true
  end

  it "plane list stores blank spaces when available" do
    expect(airport.plane_list[50..99].all? { |plane| plane.nil? }).to eq true
  end

  it "calls a plane to land if weather is fine" do
    allow(flying_plane).to receive(:location).and_return("flying")
    allow(flying_plane).to receive(:clear_for_action)
    expect { airport.call_to_land(flying_plane, "good") }.to output("Time to land\n").to_stdout
  end

  it "calls a plane to take-off if weather is fine" do
    allow(grounded_plane).to receive(:airport).and_return(:LHR)
    allow(grounded_plane).to receive(:clear_for_action)
    expect { airport.call_takeoff(grounded_plane, "good") }.to output("Time to take-off\n").to_stdout
  end

  it "raises an error if call_to_land called on a plane on the ground" do
    allow(grounded_plane).to receive(:location).and_return("grounded")
    expect { airport.call_to_land(grounded_plane) }.to raise_exception "Plane is grounded"
  end

  it "raises an error if call_takeoff called and plane not at airport" do
    allow(flying_plane).to receive(:airport).and_return(nil)
    expect { airport.call_takeoff(flying_plane) }.to raise_exception "Plane is not at this airport"
  end

  it "call_to_land raises an exception if it is bad weather" do
    allow(flying_plane).to receive(:location).and_return("flying")
    error_message = "Bad weather - landing not safe"
    expect { airport.call_to_land(flying_plane, "bad") }.to raise_exception error_message.to_s
  end

  it "call_takeoff raises an exception if it is bad weather" do
    allow(grounded_plane).to receive(:airport).and_return(:LHR)
    error_message1 = "Bad weather - takeoff not safe"
    expect { airport.call_takeoff(grounded_plane, "bad") }.to raise_exception error_message1.to_s
  end

#   it "if plane lands then it sends a signal "
end

describe Plane do
  plane = Plane.new
  airport1 = Airport.new(:LHR, 50)

  it "has default value of airport = nil" do
    expect(plane.airport).to eq nil
  end

  it "has default value of status = grounded" do
    expect(plane.location). to eq "grounded"
  end

  it "will only allow call to land to respond to 'takeoff' or 'landing' with airport_id" do
    expect { plane.clear_for_action("blah") }.to raise_exception "Not a valid clearance command"
  end

  plane1 = Plane.new
  plane1.location = "flying"

  it "if weather ok plane registers call to land" do
    airport1.call_to_land(plane1, "good")
    expect(plane1.action_status).to eq :LHR
  end

  it "if weather ok plane registers call to take off" do
    airport1.call_to_land(plane1, "good")
    plane1.land
    airport1.call_takeoff(plane1, "good")
    expect(plane1.action_status).to eq "takeoff"
  end

  it "registered as grounded at airport once landed and action_status is reset" do
    plane.clear_for_action("land", :LHR)
    plane.land
    a_s = plane.action_status
    expect(plane.airport == :LHR && plane.location == "grounded" && a_s.nil?).to eq true
  end

  it "after take off sets airport to nil, location to 'flying' and action_status resets" do
    plane.clear_for_action("takeoff")
    plane.take_off
    a_s = plane.action_status
    expect(plane.airport.nil? && plane.location == "flying" && a_s.nil?).to eq true
  end

end

describe Weather do

  it "can be set to a specific value (default random) and will return good if under 0.8" do
    expect(current_weather(0.1)).to eq "good"
  end

end
