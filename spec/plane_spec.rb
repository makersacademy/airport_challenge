require 'plane'
require 'support/shared_examples_for_takeoff_land.rb'

describe Plane do
  it_behaves_like TakeoffLand
  subject (:plane) {described_class.new}

    describe '#land' do
      let(:airport) { double :airport }
      let(:weather) { double( "weather", :stormy? => nil) }
      before {plane.land(airport, weather)}

      it 'is expected to be landed' do
        expect(plane).to be_landed
      end

      it 'is expected to be landed at an airport' do
        expect(plane.at_what_airport).to eq airport
      end

      it 'cannot land if it is already landed' do
        expect {plane.land(airport, weather)}.to raise_error("Plane has already landed!")
      end


    end

    describe '#takeoff' do
      let(:airport) {double("airport", :planes_in_airport => [plane])}
      let(:weather) { double( "weather", :stormy? => nil) }

      it 'is expected to no longer be at an airport' do
        plane.land(airport, weather)
        plane.takeoff(airport, weather)
        expect(plane.at_what_airport).to be_falsey
      end

      it 'cannot takeoff if it is not at an airport' do
        allow(plane).to receive(:at_what_airport).and_return(nil)
        expect {plane.takeoff(airport, weather)}.to raise_error("Plane cannot takeoff if it is not in an airport!")
      end

      let(:airport2){double("airport", :planes_in_airport => [])}

      it 'can only takeoff from an airport it is in' do
        plane.land(airport, weather)
        expect{plane.takeoff(airport2, weather)}.to raise_error('Plane cannot take off from an airport it is not in!')
      end

    end

    describe 'stormy weather' do
      let(:weather) {double("weather", :stormy? => true)}
      let(:airport) {double("airport", :planes_in_airport => [plane])}

      it 'is not able to takeoff in stormy weather' do
        allow(plane).to receive(:at_what_airport).and_return(airport)
        expect {plane.takeoff(airport, weather)}.to raise_error("Too stormy to takeoff!")
      end

      it 'is not able to land in stormy weather' do
        expect {plane.land(airport, weather)}.to raise_error("Too stormy to land!")
      end

    end

    # planes that are already flying cannot takes off and/or be in an airport;

end
