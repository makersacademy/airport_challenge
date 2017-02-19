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
    let(:subject) { Airport.new(weather) }

    it { is_expected.to respond_to(:land).with(1).argument }

    it "should not take off if it is not at the airport" do
      expect(subject.take_off).to eq nil
    end

    it "should not take off during stormy weather" do
      subject.land(Plane.new)
      allow(Weather.new).to receive(:stormy?) { true }
      subject = Airport.new(Weather.new.stormy?)
      expect(subject.take_off).not_to eq("The plane has taken off.")
    end

    it "should not land during stormy weather" do
      weather = Weather.new
      allow(weather).to receive(:stormy?) { true }
      subject = Airport.new(weather.stormy?)
      expect(subject.land(Plane.new)).not_to eq("The plane has landed.")
    end


  end

end
