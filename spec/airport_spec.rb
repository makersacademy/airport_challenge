require 'airport'
require 'plane'

describe Airport do

  subject(:airport) { Airport.new }
  let(:plane) { double :plane }

  it 'creates new airport object' do
    expect(airport.is_a? Airport).to eq true
  end

  it { is_expected.to respond_to(:land) }

  it 'tells the plane to land' do
    allow(plane).to receive(:land)
    airport.land(plane)
  end

  it 'checks same plane object is in the plane list after landing' do
    allow(plane).to receive(:land)
    airport.land(plane)
    expect(airport.plane_list).to include plane
  end

  it { is_expected.to respond_to(:take_off) }

  it 'tells a plane from plane list to take off' do
    allow(plane).to receive(:land)
    airport.land(plane)
    expect(airport.take_off).to eq plane
  end

  it 'checks that plane that has taken off is no longer in plane list' do
    allow(plane).to receive(:land)
    airport.land(plane)
    airport.take_off
    expect(airport.plane_list).not_to include plane
  end

  it { is_expected.to respond_to(:empty?) }

  it 'cannot take off a plane when airport has no planes' do
    allow(airport).to receive(:empty?).and_return(true)
    expect(airport.take_off).not_to eq plane
  end

end
