require "airport"
require 'rspec/expectations'

describe Airport do
  let(:plane) {double :plane}

  describe "#land" do

    it {should respond_to(:land).with(1).argument}

    it "it should accept a plane and confirm it has landed" do
      allow(subject).to receive(:stormy_weather?).and_return(false)
      subject.land(plane)
      expect(subject.planes.last).to eq plane
    end

    it "airport should prevent landing when stormy" do
      allow(subject).to receive(:stormy_weather?).and_return(true)
      expect{subject.land(plane)}.to raise_error "Too stormy to land"
    end

    it "will prevent landing when airport is full" do
      allow(subject).to receive(:stormy_weather?).and_return(false)
      subject.capacity.times{subject.land(plane)}
      expect{subject.land(plane)}.to raise_error "Airport full! No space to land"
    end

    it "system designer can set capacity of the airport" do
      allow(subject).to receive(:stormy_weather?).and_return(false)
      new_capacity = 2
      subject.capacity = new_capacity
      new_capacity.times{subject.land(plane)}
      expect{subject.land(plane)}.to raise_error "Airport full! No space to land"
    end
  end

  describe "#take_off" do

    it {should respond_to(:take_off).with(1).argument}

    it "plane should take off and confirm it is no longer at the Airport" do
      allow(subject).to receive(:stormy_weather?).and_return(false)
      subject.land(plane)
      subject.take_off(plane)
      expect(subject.planes).not_to include(plane)
    end

    it "airport should prevent take off when stormy" do
      allow(subject).to receive(:stormy_weather?).and_return(true)
      expect{subject.take_off(plane)}.to raise_error "Too stormy for take off"
    end
  end
end
