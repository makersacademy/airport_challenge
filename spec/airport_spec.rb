require 'airport'

RSpec.describe Airport do
  it 'instructs a plane to land' do
    plane = double('it is a plane')
    weather = double('weather')
    airport = Airport.new(weather: weather)
    allow(weather).to receive(:stormy?).and_return false
    expect(airport.land(plane)).to eq [plane]
  end
  it 'instructs a plane to take off' do
    plane = double('it is a plane')
    weather = double('weather')
    airport = Airport.new(weather: weather)
    allow(weather).to receive(:stormy?).and_return false
    airport.land(plane)
    expect(subject.take_off).to eq nil
  end
  it 'prevents landing when airport full' do
    airport = Airport.new
    plane = double('it is a plane')
    Airport::DEFAULT_CAPACITY.times {airport.land(plane)}
    expect { airport.land(plane) }.to raise_error('Airport Full!')
  end
end
