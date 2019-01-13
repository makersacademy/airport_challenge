require 'airport'
require 'plane'

describe Airport do
  before(:each) do
    @weather = 'fine'
    @plane = Plane.new('jumbo_jet')
    @airport = Airport.new
    @capacity = Airport::DEFAULT_CAPACITY
  end

  it "should create a new airport and assign to a variable" do
    expect(@airport.airport).to eq([])
  end

  it "should be able to land the plane by putting the plane into the airport array" do
    # allow(@airport.land(@plane)).to receive(:weather) { 'fine' }
    expect(@airport.land(@plane.name)).to include('jumbo_jet')
  end

  it "should remove the plane from array upon takeoff" do
    @airport.airport.push(@plane, 'just_one_plane')
    # allow(@airport.takeoff(@plane)).to receive(:weather) { 'fine' }
    expect(@airport.takeoff(@plane)).to eq("The plane has left the airport - see: [\"just_one_plane\"]")
  end

  it "should not allow more than capacity and therefore raise an error" do
    @capacity.times { @airport.airport.push(@plane) }
    expect { @airport.land('finalplane') }.to raise_error(RuntimeError, "Airport is full")
  end
end

describe Plane do
  before(:each) { @plane = Plane.new('jumbo_jet') }

  it "should initialize with a name so I can tell my planes apart" do
    expect(@plane.name).to eq('jumbo_jet')
  end
end
