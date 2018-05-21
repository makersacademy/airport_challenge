require './lib/airport'
require './lib/weather'

describe Airport do
  subject(:airport) { described_class.new(5, weather) }
  let(:plane) { double :plane, land: nil, take_off: nil }
  let(:weather) { double :weather }

  describe '#land_plane' do

    context 'when not stormy' do
      before do
        allow(weather).to receive(:stormy?).and_return false
      end
      it 'responds to land_plane with one argument' do
        expect(airport).to respond_to(:land_plane).with(1).argument
      end
      context 'when full' do
        it 'prevents land_plane(plane)' do
          5.times do
            airport.land_plane(plane)
          end
          expect { airport.land_plane(plane) }.to raise_error "Airport full"
        end
      end
    end
    context 'when stormy' do
      before do
        allow(weather).to receive(:stormy?).and_return true
      end
      it 'prevents land_plane(plane)' do
        expect { airport.land_plane(plane) }.to raise_error "Stormy weather"
      end
    end
  end
  describe '#take_off' do
    context 'when not stormy' do
      before do
        allow(weather).to receive(:stormy?).and_return false
      end
      it 'allows plane to take off' do
        airport.land_plane(plane)
        expect(plane).to receive(:take_off)
        airport.take_off(plane)
      end
      it 'returns the plane that took off' do
        airport.land_plane(plane)
        expect(airport.take_off(plane)).to eq plane
      end
      it 'prevents plane to leave airport that it is not in' do
        airport_1 = described_class.new(4, weather)
        airport_1.land_plane(plane)
        expect { airport.take_off(plane) }.to raise_error "Plane not at this airport"
      end
    end
    context 'when stormy' do
      before do
        allow(weather ).to receive(:stormy?).and_return true
      end
      it 'prevents take_off when stormy' do
        expect { airport.take_off(plane) }.to raise_error "Stormy weather"
      end
    end
  end
end
