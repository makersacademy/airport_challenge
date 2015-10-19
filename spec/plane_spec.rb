require 'plane'

describe Plane do

      let(:airport) { double(:airport) }
      let(:another_airport) { double(:another_airport) }
      before(:each) { allow(airport).to receive(:planes).and_return(Array.new) }
      before(:each) { allow(airport).to receive(:stormy?).and_return false }
      before(:each) { allow(airport).to receive(:full?).and_return false }
      before(:each) { allow(airport).to receive(:location).and_return(airport.object_id) }

      it { is_expected.to respond_to(:land).with(1).argument }

      it { is_expected.to respond_to(:take_off).with(1).argument }

      it { is_expected.to respond_to(:location) }

      it { is_expected.to respond_to(:location=) }

      it { is_expected.to respond_to(:status) }

      it { is_expected.to respond_to(:status=) }

      it 'is expected to be a plane upon initialization' do
        plane = Plane.new
        expect(plane).to be_instance_of(Plane)
      end

    context 'when the airport is full or not full' do
        it 'does not allow planes to land' do
          allow(airport).to receive(:full?).and_return(true)
          expect { subject.land(airport) }.to raise_error 'The airport is currently full'
        end

        it 'allows planes to land' do
          allow(airport).to receive(:full?).and_return(false)
        end
    end

    context 'when the weather is stormy' do
        it 'does not allow planes to land' do
          allow(airport).to receive(:stormy?).and_return true
          allow(airport).to receive(:full?).and_return false
          expect { subject.land(airport) }.to raise_error 'Cannot land in stormy weather'
        end
    end

    context 'when a plane is attempting to take off from an airport it is not currently stationed at' do
        it 'does not take off' do
          allow(airport).to receive(:full?).and_return false
          subject.land(airport)
          expect { subject.take_off(another_airport) }.to raise_error 'You cannot take off from that airport'
        end
    end

    context 'when a plane is flying' do
          it 'cannot take_off' do
            expect { subject.take_off(airport) }.to raise_error 'You are already flying'
      end

        it 'cannot be in an airport' do
          expect(subject.location).to_not eq(airport.location)
        end
    end

    context 'when a plane is not flying' do
        it 'cannot land' do
          subject.land(airport)
          expect { subject.land(airport) }.to raise_error 'You are not flying'
        end

        it 'must be in an airport' do
          subject.land(airport)
          expect(subject.location).to eq(airport.location)
        end
    end

    context 'when a plane has taken off from an airport' do
        it 'is no longer in that airport' do
          subject.land(airport)
          subject.take_off(airport)
          expect(subject.location).not_to eq(airport.location)
        end
    end
end
