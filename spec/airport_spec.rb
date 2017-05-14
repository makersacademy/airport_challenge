require 'airport'

describe Airport do
  it 'responds to #land_plane' do
    expect(subject).to respond_to(:land_plane).with(1).argument
  end
  it 'wants to be able to reuse a plane that landed to be ready to take off again' do
    plane = Plane.new
    expect(subject.land_plane(plane)).to eq plane
  end
  it 'confirms that a plane had landed' do
    plane = Plane.new
    expect(subject.land_plane(plane.landed?)).to eq true
  end
  it 'instructs a plane to #take_off' do
    expect(subject).to respond_to(:take_off)
  end
  it 'confirms that the plane has left the airport' do
    plane = subject.take_off
    expect(plane).to be_airbourne
  end
  it 'is expected to respond to :plane' do
    expect(subject).to respond_to :plane
  end
  it 'the airport should be able to check the current weather conditions' do
    expect(subject).to respond_to :weather_check
  end
  it 'should not #land_plane if the weather is stormy' do
    expect { subject.weather_check }.to raise_error 'Unsafe to fly'
  end
  it 'should return the default capacity of the airport' do
    expect(subject.capacity).to eq Airport::DEFAULT_CAPACITY
  end
  it 'prevents a plane from landing if the airport is full' do
    subject.capacity.times { subject.land_plane :plane }
    expect { subject.land_plane :plane }.to raise_error 'Airport at capacity: cannot land.'
  end
end
