require 'airport'

describe Airport do

  let(:plane) { double :plane }
  let(:weather) { double :weather }

  it 'instructs a plane to land' do
    allow(weather).to receive(:condition).and_return('calm')
    airport = Airport.new(1, weather)
    allow(plane).to receive(:status).and_return('flying')
    allow(plane).to receive(:status=)
    airport.land(plane)
    expect(airport.hangar[0]).to eq plane
  end
  it 'instructs a plane to take off' do
    allow(weather).to receive(:condition).and_return('calm')
    allow(plane).to receive(:status).and_return('landed')
    allow(plane).to receive(:status=)
    airport = Airport.new(1, weather)
    airport.hangar[0] = plane
    airport.take_off(plane)
    expect(airport.hangar[0]).to eq nil
  end
  it 'prevents landing when it is full' do
    allow(weather).to receive(:condition).and_return('calm')
    allow(plane).to receive(:status).and_return('flying')
    allow(plane).to receive(:status=)
    airport = Airport.new(1, weather)
    airport.hangar[0] = plane
    expect { airport.land(plane) }.to raise_error "Airport is full"
  end
  it 'has a default capacity of 1' do
    expect(subject.capacity).to eq 1
  end
  it 'has a default capacity that can be overridden' do
    airport = Airport.new(5)
    expect(airport.capacity).to eq 5
  end
  it 'prevents takeoff when weather is stormy' do
    allow(weather).to receive(:condition).and_return('stormy')
    allow(plane).to receive(:status).and_return('landed')
    airport = Airport.new(1, weather)
    airport.hangar[0] = plane
    expect { airport.take_off(plane) }.to raise_error "Plane unable to take off due to stormy weather"
  end
  it 'prevents landing when weather is stormy' do
    allow(weather).to receive(:condition).and_return('stormy')
    allow(plane).to receive(:status).and_return('flying')
    airport = Airport.new(1, weather)
    expect { airport.land(plane) }.to raise_error "Plane unable to land due to stormy weather"
  end

end
