require 'airport'

describe Airport do
  let(:plane) { double('plane') }
  let(:airport) { Airport.new }
  it 'responds to #land' do
    is_expected.to respond_to(:land)
  end
  it 'responds to #land with the arguement "plane"' do
    is_expected.to respond_to(:land).with(1).argument
  end
  it 'lands an airplane and stores it in airport' do
    airport.land(plane)
    expect(airport.landed_planes).to eq [plane]
  end
  it 'responds to #plane_takeoff' do
    is_expected.to respond_to(:plane_takeoff)
  end
  it 'when #plane_takeoff happens, plane leaves airport' do
    airport.land(plane)
    airport.plane_takeoff
    expect(airport.landed_planes).to be_empty
  end
end
