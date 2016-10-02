require 'airport'

describe Airport do
  subject(:airport) { described_class.new(weather: weather) }
  let(:plane) { double :plane }
  let(:another_plane) { double :another_plane }
  let(:weather) { double :weather }

  it { is_expected.to respond_to :land }
  it { is_expected.to respond_to :take_off }

  describe '#land' do
    context 'when weather is sunny' do
      before do
        allow(weather).to receive(:stormy?) { false }
      end

      it 'instructs plane to land' do
        expect(plane).to receive(:land)
        subject.land(plane)
      end

      it 'has plane after it has landed' do
        allow(plane).to receive(:land)
        airport.land(plane)
        expect(airport.planes).to include plane
      end

      it 'prevents plane from landing if already in airport' do
        allow(plane).to receive(:land)
        airport.land(plane)
        expect { airport.land(plane) }.to raise_error 'This plane has already landed'
      end

      it 'prevents landing when the airport is full' do
        allow(plane).to receive(:land)
        airport.land(plane)
        expect { airport.land(another_plane) }.to raise_error 'This airport can\'t receive more planes'
      end
    end

    context 'when weather is stormy' do
      it 'prevents landing when weather is stormy' do
        allow(plane).to receive(:land)
        allow(weather).to receive(:stormy?) { true }
        expect { airport.land(plane) }.to raise_error 'Landing not permited due to stormy weather'
      end
    end
  end

  describe '#take_off' do
    context 'when weather is sunny' do
      before do
        allow(weather).to receive(:stormy?) { false }
      end

      it 'instructs plane to take off' do
        allow(plane).to receive(:land)
        expect(plane).to receive(:take_off)
        airport.land(plane)
        airport.take_off(plane)
      end

      it 'doesn\'t have plane after take off' do
        allow(plane).to receive(:land)
        allow(plane).to receive(:take_off)
        airport.land(plane)
        airport.take_off(plane)
        expect(airport.planes).not_to include plane
      end

      it 'prevents plane from taking off if not in airport' do
        allow(plane).to receive(:take_off)
        expect { airport.take_off(plane) }.to raise_error 'This plane has not landed yet'
      end
    end

    context 'when weather is stormy' do
      it 'prevents take off when weather is stormy' do
        allow(plane).to receive(:land)
        allow(plane).to receive(:take_off)
        allow(weather).to receive(:stormy?) { false }
        airport.land(plane)
        allow(weather).to receive(:stormy?) { true }
        expect { airport.take_off(plane) }.to raise_error 'Take off not permited due to stormy weather'
      end
    end
  end
end
