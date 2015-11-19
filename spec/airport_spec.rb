require 'airport'

describe Airport do

  subject(:airport) {described_class.new(weather, 50)}
  let(:plane) {double :plane, land: nil, take_off: nil}
  let(:weather) {double :weather}

  before do
    allow(weather).to receive(:stormy?).and_return false
  end

  describe '#land' do
      context 'when not stormy' do
        it 'lands planes' do
          expect(plane).to receive(:land)
          airport.land(plane)
        end
      end
      context 'when airport is  full' do
        it 'raises an error' do
          50.times {airport.land(plane)}
          expect {airport.land(plane)}.to raise_error 'Cannot land plane: airport is full.'
        end
      end
      context 'when stormy' do
        it 'raises an error' do
          allow(weather).to receive(:stormy?).and_return true
          expect {airport.land(plane)}.to raise_error 'Cannot land plane: weather is stormy.'
        end
      end
  end

  describe '#planes' do
    it 'returns planes that are at the airport' do
      airport.land(plane)
      expect(airport.planes).to include plane
    end

    it 'does not return planes that have taken off' do
      airport.land(plane)
      airport.take_off(plane)
      expect(airport.planes).not_to include plane
    end
  end

  context 'defaults' do
        subject(:default_airport) {described_class.new(weather)}

        it'has a default capacity' do
          described_class::DEFAULT_CAPACITY.times {default_airport.land(plane)}
          expect {default_airport.land(plane)}.to raise_error 'Cannot land plane: airport is full.'
        end
  end

  describe '#take_off' do
    context 'when not stormy' do
      it 'allows planes to take off' do
        airport.land(plane)
        expect(plane).to receive(:take_off)
        airport.take_off(plane)
      end

      it 'returns the plane that took off' do
        airport.land(plane)
        expect(airport.take_off(plane)).to eq plane
      end

      it 'raises an error if plane is not at this airport' do
        other_airport = described_class.new(weather, 50)
        other_airport.land(plane)
        expect{airport.take_off(plane)}.to raise_error 'Cannot take off plane: plane not at this airport.'
      end
    end
    context 'when stormy' do
      it 'raises an error' do
        airport.land(plane)
        allow(weather).to receive(:stormy?).and_return true
        expect {airport.take_off(plane)}.to raise_error 'Cannot take off plane: weather is stormy.'
      end
    end
  end

  # describe '#initialize' do
  #   it 'is allowed to change airport capacity' do
  #     airport = Airport.new(weather, 100)
  #     expect(airport.capacity).to eq 100
  #   end
  # end

end
