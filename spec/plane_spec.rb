require 'spec_helper'

describe Plane do

  # new plane for each test# new airport for each test
  subject(:plane) { described_class.new }

  it "has a location that's a string" do
    expect(plane.location).to be_an_instance_of String
  end

  it "has a flight number that's a string" do
    expect(plane.flight_number).to be_an_instance_of String
  end

  describe "#in_hangar?" do

    it "knows it's not in a hangar when it's just been created" do
      expect(subject.in_hangar).to be false
    end

    it "knows it is in a hangar once its landed somewhere" do
      airport = Airport.new
      allow(airport.weather).to receive(:is_stormy) { false } # nice weather!
      airport.land(plane)
      expect(plane.in_hangar).to be true
    end

    it "knows it's not in a hangar, after it's been in and out of a hangar" do
      airport = Airport.new
      allow(airport.weather).to receive(:is_stormy) { false } # nice weather!
      airport.land(plane)
      airport.takeoff
      expect(plane.in_hangar).to be false
    end

  end

  describe "#move_to_hangar" do

    it "knows it's in the hangar" do
      expect(plane.in_hangar).to be false
      subject.move_to_hangar("Stansted Airport")
      expect(plane.in_hangar).to be true
    end

    it "updates the location" do
      expect(plane.location).to eql "the plane factory"
      subject.move_to_hangar("Stansted Airport")
      expect(plane.location).to eql "Stansted Airport"
    end

  end

  describe "#fly" do

    it "knows it's left the hangar" do
      expect(plane.in_hangar).to be false
      subject.move_to_hangar("Some Airport")
      expect(plane.in_hangar).to be true
      subject.fly
      expect(plane.in_hangar).to be false
    end

    it "updates the location to 'the sky'" do
      expect(plane.location).to eql "the plane factory"
      subject.fly
      expect(plane.location).to eql "the sky"
    end

  end

end
