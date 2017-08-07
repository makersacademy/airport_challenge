require 'airport'
require 'plane'
require 'weather'

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

  airport1 = Airport.new(:LGW, 10)

  it "once a plane has been called for landing, it is put into a potential docking list" do
    allow(flying_plane).to receive(:location).and_return("flying")
    allow(flying_plane).to receive(:clear_for_action)
    airport1.call_to_land(flying_plane, "good")
    expect(airport1.docklist.include?(flying_plane)).to eq true
  end

  it "once a plane has been called for takeoff, it is put into a potential docking list" do
    allow(grounded_plane).to receive(:airport).and_return(:LGW)
    allow(grounded_plane).to receive(:clear_for_action)
    airport1.call_takeoff(grounded_plane, "good")
    expect(airport1.releaselist.include?(grounded_plane)).to eq true
  end

  air_full = Airport.new(:FUL, 10, 10)

  it "won't allow call_landing if planes docked plus planes called in exceeds capacity" do
    error_message2 = "Not enough space for more planes"
    expect { air_full.call_to_land(flying_plane, "good") }.to raise_exception error_message2.to_s
  end

  airport2 = Airport.new(:LGW, 10)

  let(:plane_to_dock) { double :plane_to_dock }
  let(:plane_to_release) { double :plane_to_release }
  it "dock_planes checks all called planes, registers at the airport if landed&resets docklist" do
    allow(plane_to_dock).to receive(:airport).and_return(:LGW)
    airport2.docklist = [plane_to_dock]
    airport2.dock_planes
    expect(airport2.plane_list.include?(plane_to_dock) && airport2.dock_planes == []).to eq true
  end

  airport3 = Airport.new(:LGW, 10, 15)

  it "release_plane checks all planes called for takeoff&removes them if gone & resets list" do
    allow(plane_to_release).to receive(:airport).and_return(nil)
    airport3.plane_list = (airport3.plane_list.map.with_index { |x, i| i == 10 ? plane_to_release : x })
    airport3.releaselist = [plane_to_release]
    airport3.release_planes
    expect(!airport3.plane_list.include?(plane_to_release) && airport3.release_planes == []).to eq true
  end

end
