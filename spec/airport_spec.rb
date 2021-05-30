require 'airport'

describe Airport do
  it { is_expected.to respond_to(:land).with(1).argument }
  
    describe '#take_off' do
      it 'instructs a plane to take off from an airport' do
        plane = double(:plane, taking_off: 'taken off', landed: 'landed')
        subject.land(plane)
        subject.take_off(plane)
        expect(subject.planes).not_to include plane
      end

      it 'is expected to confirm that it is no longer in the airport' do
        plane = double(:plane, status: 'taken off')
        expect(plane.status).to eq('taken off')
      end

      it 'raises an error if a user tries to take off plane in an empty airport' do
        plane = double(:plane)
        allow(plane).to receive(:take_off)
        expect { subject.take_off(plane) }.to raise_error 'no planes to take off'
    end

    it 'checks if planes status is take off' do
        plane = double(:plane, status: 'taken off')
        expect(plane.status).to eq('taken off')
    end
    end

    describe '#land' do
        it 'prevent a plane form landing if the airport is full' do
            plane = double(:plane, landed: 'landed')
            subject.capacity.times { subject.land(plane) }
            expect { subject.land(plane) }.to raise_error('airport is full')
        end

        it 'checks if planes status is landed' do
            plane = double(:plane, status: 'landed')
            expect(plane.status).to eq('landed')
        end
    end
  end
