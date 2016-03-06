require 'airport'

describe Airport do
  let(:plane) { double :plane, :flying => true }

    describe '# 1. planes' do
      it { is_expected.to respond_to :planes }

      it '1.0 planes is an array' do
        expect(subject.planes).to be_a Array
      end
    end

    describe '# 2. allow_landing' do

      it '2.0 puts a plane in the planes array' do
        allow(subject).to receive(:stormy?) {false}

          subject.allow_landing(plane)

        expect(subject.planes.empty?).to be false

      end

      it '2.1 raises an error - CANNOT LAND IN A STORM' do
        allow(subject).to receive(:stormy?) {true}

        expect {

          subject.allow_landing(plane)

        }.to raise_error "CANNOT LAND IN A STORM"

      end

      it '2.2 raises an error - CANNOT LAND AIRPORT IS FULL' do

        allow(subject).to receive(:stormy?) {false}
        allow(subject).to receive(:full?) {true}

        expect {

          subject.allow_landing(plane)

        }.to raise_error "CANNOT LAND AIRPORT IS FULL"

      end

      it '2.3 raises an error CANNOT LAND AIRPORT IS FULL when at capacity' do

        allow(subject).to receive(:stormy?) {false}
        Airport::DEFAULT_CAPACITY.times{subject.allow_landing(double(:plane))}

        expect {

          subject.allow_landing(double(:plane))

        }.to raise_error "CANNOT LAND AIRPORT IS FULL"

      end
    end

    describe '# 3. allow_take_off' do

      it '3.0 removes the plane from the planes array' do
        allow(subject).to receive(:stormy?) {false}

          subject.allow_landing(plane)
          subject.allow_take_off(plane)

        expect(subject.planes.empty?).to be true

      end

      it '3.1 raises an error - CANNOT TAKE-OFF IN A STORM' do
        allow(subject).to receive(:stormy?) {false}

          subject.allow_landing(plane)

        allow(subject).to receive(:stormy?) {true}

        expect {

          subject.allow_take_off(plane)

        }.to raise_error "CANNOT TAKE-OFF IN A STORM"

      end
    end
end
