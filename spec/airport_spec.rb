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

      context 'when plane is in the airport' do
        it 'confirms plane to be not flying' do
          expect(airport.land(plane)).to eq airport.plane
        end
        it "can't land - raises error" do
          allow(airport).to receive(:flying?).and_return(false)
          expect { airport.land(plane) }.to raise_error "Plane already landed"
        end
      end

      context 'when airport is full' do
        it "can't land - raises error" do
          airport.capacity.times { airport.land(plane) }
          expect { airport.land(plane) }.to raise_error 'Airport full!'
        end
      end
    end

    context 'when weather is stormy' do
      it "can't land - raises error" do
        allow(airport).to receive(:stormy?).and_return(true)
        expect { airport.land(plane) }.to raise_error "Stormy, can't land"
      end
    end
  end

  describe '#depart' do
    context 'when weather is sunny' do
      before { allow(airport).to receive(:stormy?).and_return(false) }
      it 'instructs a plane to take off' do
        expect(airport).to respond_to(:depart).with(1).argument
      end

      context 'when plane is in the air' do
        it 'confirms plane not in the airport' do
          allow(airport).to receive(:flying?).and_return(true)
          expect(airport.at_airport).not_to include plane
        end
        it "can't depart - raises error" do
          allow(airport).to receive(:flying?).and_return(true)
          expect {airport.depart(plane)}.to raise_error "Plane already flying"
        end
      end
    end

    context 'when weather is stormy' do
      it 'prevents departing - raises error' do
        allow(airport).to receive(:stormy?).and_return(true)
        expect {airport.depart(plane)}.to raise_error "Stormy, can't depart"
      end
    end
  end


end
