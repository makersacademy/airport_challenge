require 'airport'
require 'plane'

describe Airport do

  let(:plane) { Plane.new }

  describe '#initialize' do
    it 'defaults capacity' do
      allow(subject).to receive(:stormy) { false }
      described_class::DEFAULT_CAPACITY.times do
        subject.land(plane)
        plane.make_take_off
      end
      expect(subject.planes.size).to eq described_class::DEFAULT_CAPACITY
    end
  end

  context 'when the weather is good' do
    before { allow(subject).to receive(:stormy) { false } }

    describe '#land' do
      it 'lands a plane at an airport' do
        subject.land(plane)
        expect(subject.planes).to include(plane)
      end

      it 'prevents landing when the airport is full' do
        described_class::DEFAULT_CAPACITY.times do
          subject.land(plane)
          plane.make_take_off
        end
        expect { subject.land(plane) }.to raise_error 'Airport is full'
      end

      it 'prevents a plane from landing while already landed' do
        plane.make_land
        expect { subject.land(plane) }.to raise_error 'Plane has already landed'
      end
    end

    describe '#take_off' do
      it 'takes off from the airport and is no longer there' do
        subject.land(plane)
        subject.take_off(plane)
        expect(subject.planes).not_to include(plane)
      end

      it 'only takes off planes from an airport they are in' do
        expect { subject.take_off(plane) }.to raise_error 'Plane is not at airport'
      end
    end
  end

  context 'when the weather is stormy' do
    describe '#land' do
      it 'prevents landing when the weather is stormy' do
        allow(subject).to receive(:stormy) { true }
        expect { subject.land(plane) }.to raise_error 'Cannot land, weather is stormy'
      end
    end

    describe '#take_off' do
      it 'prevents take off when weather is stormy' do
        allow(subject).to receive(:stormy) { false }
        subject.land(plane)
        allow(subject).to receive(:stormy) { true }
        expect { subject.take_off(plane) }.to raise_error 'Cannot take off, weather is stormy'
      end
    end

  end
end
