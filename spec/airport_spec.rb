require 'airport'
require 'plane'

describe Airport do
  it { is_expected.to respond_to(:land).with(1).argument }

  it { is_expected.to respond_to(:take_off) }

  it 'will confirm that the plane is no longer in the airport' do
    plane = Plane.new
    expect(subject.take_off(plane)).to eq "The plane: #{plane} has taken off"
  end
  
  it 'instructs a plane to land at an airport' do
    plane = Plane.new
    expect(subject.land(plane)).to eq "Airport is full"
  end

  it 'will prevent landing when the airport is full' do
    plane = Plane.new
    expect { subject.land(plane) }.to raise_error "Airport is full"
  end
end
