require 'airport'
require 'plane'
require 'weather'

describe "airport-challenge" do
  describe Plane do
  end

  describe Weather do
    it { is_expected.to respond_to(:stormy?) }
  end

  describe Airport do

    let(:weather) { Weather.new }
    subject(:airport) { described_class.new(weather.stormy?) }

    it "holds the number of landed planes" do
      expect(airport.airplanes_landed).to be_an_instance_of Array
    end

    it "holds a number for the default capacity" do
      expect(Airport::DEFAULT_CAPACITY).to be_an_instance_of Fixnum
    end

    describe "#land(airplane)" do
      before(:each) do
        allow(weather).to receive(:stormy?) { false }
      end

      it "should receive a plane" do
        expect(airport.land(Plane.new)).to eq("The plane has landed.")
      end

      it "should disallow landing during stormy weather" do
        allow(weather).to receive(:stormy?) { true }
        expect{ airport.land(Plane.new) }.to raise_error "Storm Alert!"
      end

      it "should disallow landing when it is full" do
        Airport::DEFAULT_CAPACITY.times{ airport.land(Plane.new) }
        expect{ airport.land(Plane.new) }.to raise_error "Airport full!"
      end
    end

    describe "#take_off" do
      before(:each) do
        allow(weather).to receive(:stormy?) { false }
      end

      it "should allow a plane to take-off" do
        airport.land(Plane.new)
        expect(airport.take_off).to eq("The plane has taken off.")
      end

      it "should disallow take-off if no planes are at the airport" do
        expect{ airport.take_off }.to raise_error "No planes available."
      end

      it "should disallow take-off during stormy weather" do
        allow(weather).to receive(:stormy?) { true }
        expect{ airport.take_off }.to raise_error "Storm Alert!"
      end
    end

  end

end
