require 'airport'
require 'plane'

describe Airport do
  let(:airport) { Airport.new }
  let(:plane) { Plane.new}
  # desribe '#land_plane' do - add in nested desribe statements for each method
  it { is_expected.to respond_to(:land).with(1).argument }

  # describe #stormy weather so plane cannot land"
   it 'does not let the plane land in stormy weather' do
     allow(airport).to receive(:stormy?).and_return true
     expect { airport.land(plane) }.to raise_error "Unable to land due to bad weather"
   end

  # describe '#grounded_planes' do
  it "stores landed planes in a list" do
  expect(Airport.new.grounded_planes).to be_a(Array)
  end

  it "registers that a landed plane has been stored" do
    airport.land(plane)
    expect(airport.grounded_planes).to eq([plane])
  end

  # desrcibe '#takeoff(plane)'
  it 'allows the plane to takeoff' do
    expect(airport).to respond_to(:takeoff).with(1).argument
  end


  it 'confirms that the plane is no longer at the airport' do
    airport.takeoff(plane)
    expect(airport.grounded_planes).to eq([])
  end

end
