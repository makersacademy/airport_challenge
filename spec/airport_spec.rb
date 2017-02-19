require 'spec_helper'

describe Airport do

  # assume good weather for each test
  before(:each) {
    allow(subject.weather).to receive(:is_stormy) { false }
  }

  # new airport for each test
  subject(:airport) { described_class.new }

  it "has a name" do
    expect(airport.name).to eql "Mystery City Airport" # hardcoded the default value for the test
  end

  it "can determine whether it's stormy" do
    expect(airport.weather.is_stormy).to satisfy {|true_or_false| true_or_false.to_s == "true" || true_or_false.to_s == "false"} # Must be a better way to check for a Boolean response in rspec...
  end

  it "has a default capacity which is a number" do
    expect(Airport::DEFAULT_CAPACITY).to be_an_instance_of Fixnum
  end

  it { is_expected.to respond_to(:capacity) }

  it "gets given its default capacity correctly" do
    expect(airport.capacity).to eql Airport::DEFAULT_CAPACITY
  end

  it "can have its default capacity be overridden" do
    expect(Airport.new(Airport::DEFAULT_CAPACITY + 50).capacity).to eql Airport::DEFAULT_CAPACITY + 50
  end

  describe "#land" do

    it "confirms whatever has landed" do
      plane = Plane.new
      expect(airport.land(plane)).to eq plane
    end

    it "throws an error if something other than a plane tries to land" do
      expect{airport.land("boat")}.to raise_error "Sorry, that doesn't seem to be a plane."
    end

    it "will not accept a landing in stormy weather" do
      allow(airport.weather).to receive(:is_stormy) { true }
      plane = Plane.new
      expect{airport.land(plane)}.to raise_error "Landing sequence for #{plane.flight_number} rejected: No planes can land in this stormy weather."
    end

    it "will not accept landings when hangar is full" do
      Airport::DEFAULT_CAPACITY.times {airport.land(Plane.new)}
      plane = Plane.new
      expect{airport.land(plane)}.to raise_error "Landing sequence for #{plane.flight_number} rejected: The hangar is full."
    end

    it "tells a plane it's landed" do
      plane = Plane.new
      airport.land(plane)
      expect(plane.in_hangar).to be true
    end

  end

  describe "#takeoff" do

    it "confirms whatever has taken off" do
      plane = Plane.new
      subject.land(plane)
      expect(airport.takeoff).to eq plane
    end

    it "will not takeoff if it's stormy weather"do
      subject.land(Plane.new)
      allow(airport.weather).to receive(:is_stormy) { true } # aiport's weather is bad, so we expect to cancel takeoff
      expect{airport.takeoff}.to raise_error "Takeoff rejected: No planes can fly in this stormy weather."
    end

    it "reminds you that you can't ask a plane to takeoff if there's no planes in the hangar" do
      expect{airport.takeoff}.to raise_error "Takeoff rejected: No planes in the hangar."
    end

    it "tells a plane it's taken off" do
      plane = Plane.new
      airport.land(plane)
      expect(plane.in_hangar).to be true
      airport.takeoff
      expect(plane.in_hangar).to be false
    end

  end

  describe "#check_hangar" do

    it "tells you when the hangar is empty" do
      expect(airport.check_hangar).to eql "The hangar is empty."
    end

    it "gives an array of strings (flight numbers) when it's not" do
      3.times {airport.land(Plane.new)}
      expect(airport.check_hangar).to be_an_instance_of Array
      expect(airport.check_hangar.length).to eql 3
      airport.check_hangar.each { |plane|
        expect(plane).to be_an_instance_of String
      }
    end

  end

end
