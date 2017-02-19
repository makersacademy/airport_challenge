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
    let(:airport) { Airport.new(weather.stormy?) }

  #  it { is_expected.to respond_to(:land).with(1).argument }

    it "should disallow take off if no planes are at the airport" do
      expect(airport.take_off).to eq nil
    end

    it "should receive a plane" do
      allow(weather).to receive(:stormy?) { false }
      expect(airport.land(Plane.new)).to eq("The plane has landed.")
    end

    it "should allow a plane to takeoff" do
      allow(weather).to receive(:stormy?) { false }
      airport.land(Plane.new)
      expect(airport.take_off).to eq("The plane has taken off.")
    end

    it "should not allow take off during stormy weather" do
      airport.land(Plane.new)
      allow(weather).to receive(:stormy?) { true }
      airport = Airport.new(weather.stormy?)
      expect(airport.take_off).not_to eq("The plane has taken off.")
    end

    it "should not allow landing during stormy weather" do
      allow(weather).to receive(:stormy?) { true }
      expect(airport.land(Plane.new)).not_to eq("The plane has landed.")
    end

    it "should not allow landing when it is full" do
      allow(weather).to receive(:stormy?) { false }
      10.times{ airport.land(Plane.new) }
      expect(airport.land(Plane.new)).to eq("Airport full.")
    end

    it "should have an adjustable default capacity" do
      allow(weather).to receive(:stormy?) { false }
      10.times{ airport.land(Plane.new) }
      expect(airport.land(Plane.new)).to eq("Airport full.")
    end


  end

end
