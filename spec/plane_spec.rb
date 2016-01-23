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
      let(:weather) { double( "weather", :stormy? => nil) }

      it { is_expected.to respond_to(:takeoff).with(2).arguments}

      it 'is expected to no longer be at an airport' do
        plane.land(airport)
        plane.takeoff(airport, weather)
        expect(plane.at_what_airport).to be_falsey
      end

    end

    describe 'stormy weather' do
      let(:weather) {double("weather", :stormy? => true)}
      let(:airport) { double :airport }

      it 'is not able to takeoff in stormy weather' do
        expect {plane.takeoff(airport, weather)}.to raise_error("Too stormy to takeoff!")
      end

    end

end
