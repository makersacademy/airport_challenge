require 'airport'
require 'plane'

describe Airport do
  it { is_expected.to respond_to(:land).with(1).argument }

  it { is_expected.to respond_to(:take_off) }

  it 'will confirm that the plane is no longer in the airport' do
    expect(subject.take_off).to eq "The plane has taken off"
  end
  it 'instructs a plane to land at an airport' do
    plane = Plane.new
    expect(subject.land(plane)).to eq plane
  end
  it 'will prevent landing when the airport is full' do

  end
end
