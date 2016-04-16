require 'plane'

describe Plane do

 let(:plane) {Plane.new}
 let(:airport) {double("airport")}

  it 'can create a plane object' do
    expect(plane).to be_an_instance_of Plane
  end
  it 'plane object can call land method' do
    expect(plane).to respond_to(:land).with(1).argument
  end
  it 'the plane lands at an airport' do
    expect(plane).to respond_to(:land).with(1).argument
  end
  it 'check status of landing' do
  expect(plane).to respond_to(:landed?)
  end

    describe "#land" do
    it "plane lands at the airport in the parameter" do
      expect(plane.land airport).to eq airport
    end
  end


end