require 'plane'

describe Plane do

  let(:airport) { double(:airport) }

  describe "#land" do
    it "should land at an airport" do
      expect(subject).to respond_to(:land).with(1).argument
    end
    it "should change its status to 'landed'" do
      expect(subject).to respond_to(:status)
      allow(airport).to receive(:dock)
      allow(airport).to receive(:weather_conditions).and_return(:sunny)
      subject.land(airport)
      expect(subject.status).to eq(:landed)
    end
    it "should not land if the weather is 'stormy'" do
      allow(airport).to receive(:weather_conditions).and_return(:stormy)
      expect { subject.land(airport) }.to raise_error("Authorization denied due to stormy weather")
    end
  end

  describe "#take_off" do
    it "should take off from an airport" do
      expect(subject).to respond_to(:take_off).with(1).argument
    end
    it "should change its status to 'in flight'" do
      allow(airport).to receive(:confirm_take_off)
      allow(airport).to receive(:weather_conditions).and_return(:sunny)
      subject.take_off(airport)
      expect(subject.status).to eq(:in_flight)
    end
    it "should not take_off if the weather is 'stormy'" do
      allow(airport).to receive(:weather_conditions).and_return(:stormy)
      expect { subject.take_off(airport) }.to raise_error("Authorization denied due to stormy weather")
    end
  end
end
