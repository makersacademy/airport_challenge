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

    let(:weather) { Weather.new.stormy? }
    let(:airport) { Airport.new(weather) }

    it { is_expected.to respond_to(:land).with(1).argument }

    it "should not allow take off if plane is not at the airport" do
      expect(airport.take_off).to eq nil
    end

    it "should receive a plane" do
      weather = Weather.new
      allow(weather).to receive(:stormy?) { false }
      airport = Airport.new(weather.stormy?)
      expect(airport.land(Plane.new)).to eq("The plane has landed.")
    end

    it "should allow a plane to takeoff" do
      weather = Weather.new
      allow(weather).to receive(:stormy?) { false }
      airport = Airport.new(weather.stormy?)
      airport.land(Plane.new)
      expect(airport.take_off).to eq("The plane has taken off.")
    end

    it "should not allow take off during stormy weather" do
      airport.land(Plane.new)
      allow(Weather.new).to receive(:stormy?) { true }
      airport = Airport.new(Weather.new.stormy?)
      expect(airport.take_off).not_to eq("The plane has taken off.")
    end

    it "should not allow landing during stormy weather" do
      weather = Weather.new
      allow(weather).to receive(:stormy?) { true }
      airport = Airport.new(weather.stormy?)
      expect(airport.land(Plane.new)).not_to eq("The plane has landed.")
    end

    it "should not allow landing when airport is full" do
      weather = Weather.new
      allow(weather).to receive(:stormy?) { false }
      airport = Airport.new(weather.stormy?)
      airport.land(Plane.new)
      expect(airport.land(Plane.new)).to eq("Airport full.")
    end

    xit "should override the airport's default capacity" do



    end


  end

end
