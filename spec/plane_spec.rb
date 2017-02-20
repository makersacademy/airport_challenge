require 'plane'
require 'airport'
require 'weather'

describe Plane do
  subject(:plane) { described_class.new }
  let (:airport) { double(:airport, :full? => false, :planes => [])}

  describe "airport tests" do
    before :each do
      allow(plane).to receive(:stormy?).and_return(false)
    end

    describe '#current_status' do
      before :each do
        plane.land(airport)
      end

      it "expects current_status to indicate when plane is in airport" do
        expect(plane.current_status).to eq :in_airport
      end

      it "expects current_status to indicate when plane is in the air" do
        plane.take_off(airport)
        expect(plane.current_status).to eq :in_air
      end
    end

    describe '.land' do

      it "confirms the plane has landed in an airport" do
        expect(plane.land(airport)).to eq "Plane has landed"
      end

      it "raises exception if plane is not in air" do
        plane.land(airport)
        expect{plane.land(airport)}.to raise_error "Plane is already in airport"
      end

      it "raises exception if airport is full" do
        allow(airport).to receive(:full?).and_return(true)
        expect{plane.land(airport)}.to raise_error "Airport is full"
      end

      it "prevents landing if weather is stormy" do
        allow(plane).to receive(:stormy?).and_return(true)
        expect{plane.land(airport)}.to raise_error "Plane cannot land due to stormy weather"
      end

      it "allows landing if weather is not stormy" do
        expect{plane.land(airport)}.not_to raise_error
      end
    end

    describe '.take_off' do

      it "confirms the plane has taken off" do
        plane.land(airport)
        expect(plane.take_off(airport)).to eq "Plane has taken off"
      end

      it "removes the plane from its current airport" do
        plane.land(airport)
        plane.take_off(airport)
        expect(airport.planes).to eq []
      end

      it "prevents take off unless the plane is in the airport" do
        expect{plane.take_off(airport)}.to raise_error "Plane is not in this airport"
      end

      it "prevents take off if the weather is stormy" do
        plane.land(airport)
        allow(plane).to receive(:stormy?).and_return(true)
        expect{plane.take_off(airport)}.to raise_error "Plane cannot take off due to stormy weather"
      end

      it "allows take off if the weather is not stormy" do
        plane.land(airport)
        allow(plane).to receive(:stormy?).and_return(false)
        expect{plane.take_off(airport)}.not_to raise_error
      end
    end
  end
end
