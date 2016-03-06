require 'plane'

describe Plane do
  let(:airport) { double :airport, :planes => [] }

    describe '# 1.flying' do
      it { is_expected.to respond_to :flying }
    end

    describe '# 2.land' do
      it '2.0 plane is no longer flying' do

        allow(airport).to receive(:allow_landing).and_return(:plane)
        allow(airport).to receive(:stormy?) {false}

          subject.land(airport)

        expect(subject.flying).to be(false)

      end

      it '2.1 lands the plane in a specific airport' do

        allow(airport).to receive(:allow_landing).and_return(:plane)
        allow(airport).to receive(:planes).and_return(:planes)
        allow(airport).to receive(:stormy?) {false}

          subject.land(airport)

        expect(airport.planes.empty?).to be(false)

      end


      it '2.2 raises an error - CANNOT LAND A LANDED PLANE' do

        allow(airport).to receive(:allow_landing).and_return(:plane)
        allow(airport).to receive(:stormy?) {false}

          subject.land(airport)

        expect {subject.land(airport)}.to raise_error "CANNOT LAND A LANDED PLANE"

      end
    end

    describe '# 3. take_off' do

      let(:airport) { double :airport, :planes => [subject] }

      it '3.0 plane is flying' do

        allow(airport).to receive(:allow_landing).and_return(:plane)
        allow(airport).to receive(:allow_take_off).and_return(:plane)
        allow(airport).to receive(:stormy?) {false}

          subject.land(airport)

        subject.take_off(airport)
        expect(subject.flying).to be(true)

      end

      it '3.1 take_off calls the allow_take_off method' do

        allow(airport).to receive(:allow_landing).and_return(:plane)
        allow(airport).to receive(:stormy?) {false}

          subject.land(airport)

        expect(airport).to receive(:allow_take_off)

          subject.take_off(airport)

      end

      it '3.2 raises an error - A FLYING PLANE CANNOT TAKE-OFF' do

        allow(airport).to receive(:stormy?) {false}

        expect {

          subject.take_off(airport)

        }.to raise_error "A FLYING PLANE CANNOT TAKE-OFF"

      end

      let(:airport1) { double :airport, :planes => [] }
      let(:airport2) { double :airport, :planes => [] }

      it "3.3 raises an error - PLANE IS NOT AT THAT AIRPORT" do

        allow(airport1).to receive(:allow_landing).and_return(:plane)
        allow(airport1).to receive(:allow_take_off).and_return(:plane)
        allow(airport1).to receive(:stormy?) {false}

        allow(airport2).to receive(:allow_landing).and_return(:plane)
        allow(airport2).to receive(:allow_take_off).and_return(:plane)
        allow(airport2).to receive(:stormy?) {false}

          subject.land(airport1)

        expect {

          subject.take_off(airport2)

        }.to raise_error "PLANE IS NOT AT THAT AIRPORT"

      end
    end
end
