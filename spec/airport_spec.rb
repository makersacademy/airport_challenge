require 'airport'

describe Airport do
  subject(:airport) { described_class.new(described_class::AIRPORT_CAPACITY)}
  let(:plane) { double :plane }

  describe '#land' do
    context 'when weather is sunny' do
      before { allow(airport).to receive(:stormy?).and_return(false) }

      it 'instructs a plane to land' do
        expect(airport).to respond_to(:land).with(1).argument
      end

      context 'when plane is at the airport' do

        it 'confirms plane to be not flying' do
          expect(airport.land(plane)).to eq airport.plane
        end

        it 'prevents landing - raises error' do
          allow(airport).to receive(:flying?).and_return(false)
          expect { airport.land(plane) }.to raise_error "Error: Can't land a non-flying plane"
        end

      end

      context 'when airport is full' do
        it 'prevents landing - raises error' do
          airport.capacity.times { airport.land(plane) }
          expect { airport.land(plane) }.to raise_error 'Error: Airport full!'
        end

      end

    end

    context 'when weather is stormy' do
      it 'prevents landing - raises error' do
        allow(airport).to receive(:stormy?).and_return(true)
        expect { airport.land(plane) }.to raise_error "Error: Too stormy, can't land!"
      end
    end
  end

  describe '#depart' do
    context 'when weather is sunny' do
      before { allow(airport).to receive(:stormy?).and_return(false) }
      it 'instructs a plane to take off' do
        expect(airport).to respond_to(:depart).with(1).argument
      end

      it 'confirms if plane is no longer in the airport' do
        allow(airport).to receive(:land).and_return(plane)
        airport.depart(plane)
        expect(airport.at_airport).not_to include plane
      end
    end

    context 'when weather is stormy' do
      it 'prevents departing - raises error' do
        allow(airport).to receive(:stormy?).and_return(true)
        expect { airport.depart(plane) }.to raise_error "Error: Too stormy, can't depart!"
      end
    end
  end


end
