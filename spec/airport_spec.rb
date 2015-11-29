require 'airport'

describe Airport do

  subject(:airport) { described_class.new }
  let(:plane) { double(:plane, land: nil, take_off: nil) }
  let(:weather) { double(:weather) }

  it 'is expected to initialize with @planes set to an empty array' do
    expect(airport.planes).to eq []
  end

  context 'while weather is fine' do

    before do
      allow(airport).to receive(:too_stormy?).and_return(false)
    end

    describe '#land' do

      it 'is expected to add the plane to the @planes array' do
        airport.land(plane)
        expect(airport.planes).to include plane
      end

      it 'is expected to instruct the plane to make a landing' do
        expect(plane).to receive(:land)
        airport.land(plane)
      end
    end

    describe '#take_off' do

      it 'is expected to raise an error if plane isn\'t at airport' do
        not_here = 'Plane is not at this airport'
        expect { airport.take_off(plane) }.to raise_error not_here
      end

      it 'is expected to instruct the plane to take off' do
        airport.land(plane)
        expect(plane).to receive(:take_off)
        airport.take_off(plane)
      end

      it 'is expected to remove the plane from the @planes array' do
        airport.land(plane)
        airport.take_off(plane)
        expect(airport.planes).not_to include plane
      end
    end
  end

  context 'while weather is stormy' do

    before do
      allow(airport).to receive(:too_stormy?).and_return(true)
    end

    describe '#land' do
      it 'is expected to raise an error due to storm' do
        too_stormy = 'Weather too stormy to land'
        expect { airport.land(plane) }.to raise_error too_stormy
      end
    end

    describe '#take_off' do
      it 'is expected to raise an error due to storm' do
        too_stormy = 'Weather too stormy to take off'
        expect { airport.take_off(plane) }.to raise_error too_stormy
      end
    end
  end
end
