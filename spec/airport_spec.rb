require 'airport'

describe Airport do
  airport = Airport.new(:LHR, 50)
  p airport.plane_list[50..99]
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

  it "calls a plane to land" do
    allow(flying_plane).to receive(:status).and_return("flying")
    expect { airport.call_to_land(flying_plane) }.to output("Time to land\n").to_stdout
  end

  it "calls a plane to take-off" do
    allow(grounded_plane).to receive(:airport).and_return(:LHR)
    expect { airport.call_to_take_off(grounded_plane) }.to output("Time to take-off\n").to_stdout
  end

  it "raises an error if call_to_land called on a plane on the ground" do
    allow(flying_plane).to receive(:status).and_return("grounded")
    expect { airport.call_to_land(flying_plane) }.to raise_exception "Plane is grounded"
  end

  it "raises an error if call_to_take_off called and plane not at airport" do
    allow(grounded_plane).to receive(:airport).and_return(nil)
    expect { airport.call_to_take_off(grounded_plane) }.to raise_exception "Plane is not at this airport"
  end

end

describe Plane do
  plane = Plane.new

  it "has default value of airport = nil" do
    expect(plane.airport).to eq nil
  end

  it "has default value of status = grounded" do
    expect(plane.status). to eq "grounded"
  end

end
