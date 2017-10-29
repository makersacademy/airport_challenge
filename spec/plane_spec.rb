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
      subject.land(airport)
      expect(subject.status).to eq(:landed)
    end
  end

  describe "#take_off" do
    it "should take off from an airport" do
      expect(subject).to respond_to(:take_off).with(1).argument
    end
    it "should change its status to 'in flight'" do
      allow(airport).to receive(:confirm_take_off)
      subject.take_off(airport)
      expect(subject.status).to eq(:in_flight)
    end
  end

  # describe "#confirm_take_off" do
  #   it "should confirm take off with airport" do
  #     expect(subject). to respond_to(:confirm_take_off).with(1).argument
  #   end
  # end
end
