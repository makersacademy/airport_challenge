require 'airport'
PLANES_CAPACITY = 30

describe Airport do
  it { expect(subject).to respond_to :take_off_plane }
  it { expect(subject).to respond_to(:land_plane).with(1).argument }

  context 'when airport operates' do
    let(:plane) { double :plane }
    let(:weather) { double :weather }
    before {
      allow(weather).to receive(:stormy?).and_return(false)
    }

    context 'and planes are available' do
      let(:airport) { return Airport.new(1, PLANES_CAPACITY, weather) }
      before {
        allow(plane).to receive(:mark_as_landed)
      }

      it 'is possible to take off plane' do
        allow(plane).to receive(:flying?).and_return(false)
        airport.take_off_plane
        expect(airport.planes_garage).to eq([])
      end
      it 'marks plane as flying' do
        allow(plane).to receive(:flying?).and_return(true)
        expect(plane).to receive(:mark_as_flying)
        airport.land_plane(plane)
        airport.take_off_plane
      end
    end

    context 'and planes are not available' do
      let(:airport) { return Airport.new(nil, 0, weather) }

      it 'raises an error' do
        expect { airport.take_off_plane }.to raise_error('No planes available for take-off!')
      end
    end

    context 'and airport is not full' do
      let(:airport) { return Airport.new(0, 1, weather) }

      it 'is possible to land plane' do
        allow(plane).to receive(:flying?).and_return(true)
        allow(plane).to receive(:mark_as_landed)
        airport.land_plane(plane)
        expect(airport.planes_garage.count).to eq(1)
      end
      it 'marks plane as landed' do
        allow(plane).to receive(:flying?).and_return(true)
        allow(plane).to receive(:mark_as_landed)
        airport.land_plane(plane)
      end
    end

    context 'and airport is full' do
      it 'raises an error' do
        expect { subject.land_plane(plane) }.to raise_error('Landing is not possible!')
      end
    end

    context 'and no planes available for landing' do
      it 'rase an error' do
        allow(plane).to receive(:flying?).and_return(false)
        expect { subject.land_plane(plane) }.to raise_error('Landing is not possible!')
      end
    end
  end
end
