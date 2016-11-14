require './lib/airport'
require './lib/weather'
describe Airport do

  let(:plane) { double :plane}
  subject(:airport) { described_class.new }

  context 'weather is good' do
    before do
    allow(airport.weather).to receive(:stormy?) { false }
    end

    it 'lands a plane' do
      expect(airport.land(plane)).to eq airport.planes
    end

    it 'confirms planes have landed' do
      airport.land(plane)
      expect(airport.planes).to eq airport.planes
    end

    it 'ensures planes that have already landed cannot land again' do
      airport.land(@plane)
      expect { airport.land(@plane) }.to raise_error 'plane has already landed'
    end

    it 'instructs a plane to take off' do
      airport.land(@plane)
      expect(airport.take_off(@plane)).to eq airport.plane
    end

    it 'ensures planes can only take off from airports they are in' do
      expect { airport.take_off(plane) }.to raise_error 'no planes to take off'
    end

    it 'ensures planes already flying cannot takeoff' do
      airport.land(@plane)
      airport.take_off(@plane)
      expect { airport.take_off(@plane) }.to raise_error 'no planes to take off'
    end

    it 'confirms planes are no longer in the airport after take off' do
      airport.land(@plane)
      airport.take_off(@plane)
      expect(airport.empty?).to eq true
    end


    it 'has a default capacity of 5 planes and stops planes from landing if it is full' do
        5.times {airport.land(Plane.new)}
        expect { airport.land(plane) }.to raise_error "Airport is full"
    end

  end

context 'when created a new airport' do
  it 'has a capacity that can be overriden as appropriate' do
    airport2 = Airport.new(7)
    allow(airport2.weather).to receive(:stormy?).and_return false
    7.times {airport2.land(Plane.new) }
    expect { airport2.land(Plane.new) }.to raise_error "Airport is full"
  end
end


context 'weather is not always good' do
  before do
    allow(airport.weather).to receive(:stormy?).and_return true
  end


  it 'prevents planes from landing if weather is stormy' do
    allow(airport.weather).to receive(:stormy?).and_return true
    expect { airport.land(@plane) }.to raise_error 'plane cannot land in stormy weather'
  end

  it 'prevents planes from take off if weather is stormy' do
    allow(airport.weather).to receive(:stormy?).and_return false
    airport.land(@plane)
    allow(airport.weather).to receive(:stormy?).and_return true
    expect { airport.take_off(@plane) }.to raise_error 'plane cannot take off in stormy weather'
  end
end

end
