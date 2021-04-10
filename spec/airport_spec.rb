require 'airport'

describe Airport do

  let(:plane) { double :plane }

  it 'instructs a plane to land' do
    subject.weather = 'calm'
    allow(plane).to receive(:status).and_return('flying')
    allow(plane).to receive(:status=)
    subject.land(plane)
    expect(subject.hangar[0]).to eq plane
  end
  it 'instructs a plane to take off' do
    allow(plane).to receive(:status).and_return('landed')
    allow(plane).to receive(:status=)
    subject.weather = 'calm'
    subject.hangar[0] = plane
    subject.take_off(plane)
    expect(subject.hangar[0]).to eq nil
  end
  it 'prevents landing when it is full' do
    allow(plane).to receive(:status).and_return('flying')
    allow(plane).to receive(:status=)
    subject.weather = 'calm'
    subject.hangar[0] = plane
    expect { subject.land(plane) }.to raise_error "Airport is full"
  end
  it 'has a default capacity of 1' do
    expect(subject.capacity).to eq 1
  end
  it 'has a default capacity that can be overridden' do
    airport = Airport.new(5)
    expect(airport.capacity).to eq 5
  end
  it 'prevents takeoff when weather is stormy' do
    allow(plane).to receive(:status).and_return('landed')
    subject.hangar[0] = plane
    subject.weather = 'stormy'
    expect { subject.take_off(plane) }.to raise_error "Plane unable to take off due to stormy weather"
  end
  it 'prevents landing when weather is stormy' do
    allow(plane).to receive(:status).and_return('flying')
    subject.weather = 'stormy'
    expect { subject.land(plane) }.to raise_error "Plane unable to land due to stormy weather"
  end

end
