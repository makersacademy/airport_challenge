require 'airport'

describe Airport do

  subject(:airport) { described_class.new(weather) }
  let(:plane) { double(:plane, landed?: false, land: nil, take_off: nil) }
  let(:weather) { double(:weather) }

  describe '#initialize' do

    it 'initializes with default capacity' do
      expect(airport.capacity).to eq Airport::DEFAULT_CAPACITY
    end
    
    it 'initializes with specified capacity' do
      airport = described_class.new(50, weather)
      expect(airport.capacity).to eq 50
    end

  end

  describe '#land' do

    context 'when it\'s not stormy' do

      before do
        allow(weather).to receive(:stormy?).and_return false
      end
      
      it 'can land a plane' do
        expect(airport.land(plane)).to eq "Plane landed!"
      end

      it 'doesn\'t land a plane when there\'s no space' do
        airport.capacity.times { airport.land(plane) }
        expect { airport.land(plane) }.to raise_error(RuntimeError, 'No extra space!')
      end
      
      it 'when plane has landed, it is in the airport' do
        airport.land(plane)
        expect(airport.landed_planes).to include plane
      end

      it 'when plane is landed, it can\'t land again' do
        allow(plane).to receive(:landed?).and_return true
        expect { airport.land(plane) }.to raise_error(RuntimeError, 'The plane is already landed!')
      end

    end

    context 'when it\'s stormy' do

      it 'doesn\'t land a plane and raises an error' do
        allow(weather).to receive(:stormy?).and_return true
        expect { airport.land(plane) }.to raise_error(RuntimeError, 'Too stormy to land!')
      end

    end
    
  end

  describe '#take_off' do

    before do 
      allow(plane).to receive(:in_flight?).and_return false
    end

    context 'when it\'s not stormy' do

      before do 
        allow(weather).to receive(:stormy?).and_return false
      end

      it 'lets plane take off' do
        airport.land(plane)
        expect(airport.take_off(plane)).to eq "Plane took off!"
      end

      it 'when plane is in flight, it can\'t take off' do
        allow(plane).to receive(:in_flight?).and_return true
        expect { airport.take_off(plane) }.to raise_error(RuntimeError, 'The plane is already in flight!')
      end
      
      it 'raises an error when there are no planes to take off' do
        allow(airport).to receive(:empty?).and_return true
        expect { airport.take_off(plane) }.to raise_error(RuntimeError, 'There are no planes!')
      end

      it 'when plane is in flight, it is not in the airport' do
        airport.land(plane)
        airport.take_off(plane)
        expect(airport.landed_planes).not_to include plane
      end

    end

    context 'when it\'s not stormy' do

      it 'does not let plane take off when the weather is stormy' do
        allow(weather).to receive(:stormy?).and_return true
        expect { airport.take_off(plane) }.to raise_error(RuntimeError, 'Too stormy to fly!')
      end

    end
  end
end
