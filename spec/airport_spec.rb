require 'spec_helper'

describe Airport do

  # assume good weather for each test
  before(:each) { allow(subject.weather).to receive(:is_stormy) { false } }

  # To land we expect a Plane as an argument
  it {is_expected.to respond_to(:land).with(1).argument}

  it { is_expected.to respond_to(:takeoff) }

  it { is_expected.to respond_to(:planes_in_hangar) }

  it "should be able to find out the weather" do
    is_expected.to respond_to(:weather)
  end

  it "has a default capacity which is a number" do
    expect(Airport::DEFAULT_CAPACITY).to be_an_instance_of Fixnum
  end

  it { is_expected.to respond_to(:capacity) }

  it "gets given its default capacity correctly" do
    expect(subject.capacity).to eql Airport::DEFAULT_CAPACITY
  end

  it "can have its default capacity be overridden" do
    expect(Airport.new(Airport::DEFAULT_CAPACITY + 50).capacity).to eql Airport::DEFAULT_CAPACITY + 50
  end

  describe "#land" do

    it "confirms whatever has landed" do
      plane = Plane.new
      expect(subject.land(plane)).to eq plane
    end

    it "throws an error if something other than a plane tries to land" do
      expect{subject.land("boat")}.to raise_error "Landing rejected: That doesn't seem to be a plane."
    end

    it "will not accept a landing in stormy weather" do
      allow(subject.weather).to receive(:is_stormy) { true }
      expect{subject.land(Plane.new)}.to raise_error "Landing rejected: No planes can land in this stormy weather."
    end

    it "will not accept landings when hangar is full" do
      plane = Plane.new
      Airport::DEFAULT_CAPACITY.times {subject.land(plane)}
      expect{subject.land(plane)}.to raise_error "Landing rejected: The hangar is full."
    end

  end

  describe "#takeoff" do

    it "confirms whatever has taken off" do
      plane = Plane.new
      subject.land(plane)
      expect(subject.takeoff).to eq plane
    end

    it "will not takeoff if it's stormy weather"do
      subject.land(Plane.new)
      allow(subject.weather).to receive(:is_stormy) { true } # aiport's weather is bad, so we expect to cancel takeoff
      expect{subject.takeoff}.to raise_error "Takeoff rejected: No planes can fly in this stormy weather."
    end

    it "reminds you that you can't ask a plane to takeoff if there's no planes in the hangar" do
      expect{subject.takeoff}.to raise_error "Takeoff rejected: No planes in the hangar."
    end

  end

end
