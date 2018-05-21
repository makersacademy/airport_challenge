require './lib/airport'
require './lib/plane'
require './lib/weather'

describe Airport do
  let(:plane) { double :plane, land: nil }
  let(:weather) { double :weather }

  describe '#land_plane' do
    context 'when not stormy' do
      before do
        allow(weather).to receive(:stormy?).and_return false
      end
      it 'responds to land_plane with one argument' do
        expect(subject).to respond_to(:land_plane).with(1).argument
      end
      context 'when full' do
        it 'prevents land_plane(plane)' do
          allow(subject).to receive(:stormy?).and_return false
          5.times do
            subject.land_plane(plane)
          end
          expect { subject.land_plane(plane) }.to raise_error "Airport full"
        end
      end
    end
    context 'when stormy' do
      before do
        allow(subject).to receive(:stormy?).and_return true
      end
      it 'prevents land_plane(plane)' do
        expect { subject.land_plane(plane) }.to raise_error "Stormy weather"
      end
    end
  end
  describe '#take_off' do
    context 'when not stormy' do
      before do
        allow(weather).to receive(:stormy?).and_return false
      end
    end
    context 'when stormy' do
      before do
        allow(subject).to receive(:stormy?).and_return true
      end
      it 'prevents take_off when stormy' do
        expect { subject.take_off(plane) }.to raise_error "Stormy weather"
      end
    end
  end
end
