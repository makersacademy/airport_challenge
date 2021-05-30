require 'airport'

describe Airport do
  it { is_expected.to respond_to(:land).with(1).argument }
  
    describe '#take_off' do
      it 'instructs a plane to take off from an airport' do
        plane = double(:plane)
        allow(plane).to receive(:taking_off)
        allow(plane).to receive(:landed)
        subject.land(plane)
        subject.take_off(plane)
        expect(subject.planes).not_to include plane
      end

      it 'is expected to confirm that it is no longer in the airport' do
        plane = double(:plane, status: 'taken off')
        expect(plane.status).to eq('taken off')
      end
    end

    describe '#land' do
        it 'prevent a plane form landing if the airport is full' do
            plane = double(:plane)
            allow(plane).to receive(:landed)
            subject.capacity.times { subject.land(plane) }
            expect { subject.land(plane) }.to raise_error('airport is full')
        end
    end
  end
