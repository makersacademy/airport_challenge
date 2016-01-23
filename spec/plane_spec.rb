require 'plane'

describe Plane do
  subject (:plane) {described_class.new}

    describe '#land' do
      let(:airport) { double :airport }

      it { is_expected.to respond_to(:land).with(1).argument}

      it 'is expected to be landed' do
        plane.land(airport)
        expect(plane).to be_landed
      end

      it 'is expected to be landed at an airport' do
        plane.land(airport)
        expect(plane.at_what_airport).to eq airport
      end

    end

    describe '#takeoff' do
      let(:airport) { double :airport }

      it { is_expected.to respond_to(:takeoff).with(1).argument}

      it 'is expected to no longer be at an airport' do
        plane.land(airport)
        plane.takeoff(airport)
        expect(plane.at_what_airport).to be_falsey
      end



    end

end
