require 'plane'

describe Plane do

  let(:airport) { double(:airport) }

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

    context 'when the airport is full' do
      it 'does not allow planes to land' do
        allow(airport).to receive(:weather=)
        allow(airport).to receive(:weather).and_return 'sunny'
        allow(airport).to receive(:capacity).and_return 2
        allow(airport).to receive(:full?).and_return(false,false,true)
        allow(airport).to receive(:planes).and_return Array.new
        allow(airport).to receive(:location).and_return :location.object_id
        airport.weather = 'sunny'
        airport.capacity.times do
          plane = Plane.new
          plane.land(airport)
        end
        airport.full?
        expect { subject.land(airport) }.to raise_error 'The airport is currently full'
      end
    end

    context 'when the weather is stormy' do
      it 'does not allow planes to land' do
        allow(airport).to receive(:weather=).and_return 'stormy'
        allow(airport).to receive(:weather).and_return 'stormy'
        allow(airport).to receive(:full?).and_return false
        airport.weather = 'stormy'
        expect { subject.land(airport) }.to raise_error 'Cannot land in stormy weather'
      end
    end

    context 'when a plane is attempting to take off from an airport it is not currently stationed at' do
      it 'does not take off' do
        allow(airport).to receive(:weather=)
        allow(airport).to receive(:weather).and_return 'sunny'
        allow(airport).to receive(:planes).and_return Array.new
        allow(airport).to receive(:location).and_return airport.object_id
        allow(airport).to receive(:full?).and_return false
        airport.weather = 'sunny'
        another_airport = Airport.new
        another_airport.weather = 'sunny'
        subject.land(airport)
        expect { subject.take_off(another_airport) }.to raise_error 'You cannot take off from that airport'
      end
    end

    context 'when a plane is flying' do
      it 'cannot take_off' do
        expect { subject.take_off(airport) }.to raise_error 'You are already flying'
      end


      it 'cannot be in an airport' do
        allow(airport).to receive(:weather=)
        allow(airport).to receive(:weather).and_return 'sunny'
        allow(airport).to receive(:full?).and_return false
        allow(airport).to receive(:planes).and_return Array.new
        allow(airport).to receive(:location).and_return airport.object_id
        airport.weather = 'sunny'
        subject.land(airport)
        subject.take_off(airport)
        expect(subject.location).to_not eq(airport.location)
      end
    end

    context 'when a plane is not flying' do
      it 'cannot land' do
        allow(airport).to receive(:weather=)
        allow(airport).to receive(:weather).and_return 'sunny'
        allow(airport).to receive(:full?).and_return false
        allow(airport).to receive(:planes).and_return Array.new
        allow(airport).to receive(:location).and_return airport.object_id
        airport.weather = 'sunny'
        subject.land(airport)
        expect { subject.land(airport) }.to raise_error 'You are not flying'
      end

      it 'must be in an airport' do
        allow(airport).to receive(:weather=)
        allow(airport).to receive(:weather).and_return 'sunny'
        allow(airport).to receive(:full?).and_return false
        allow(airport).to receive(:planes).and_return Array.new
        allow(airport).to receive(:location).and_return airport.object_id
        airport.weather = 'sunny'
        subject.land(airport)
        expect(subject.location).to eq(airport.location)
      end
    end

    context 'when a plane has taken off from an airport' do
      it 'is no longer in that airport' do
        airport = Airport.new
        airport.weather = 'sunny'
        subject.land(airport)
        subject.take_off(airport)
        expect(subject.location).not_to eq(airport.location)
      end
    end
end
