require 'airport'

describe Airport do
  let(:plane) { double(:plane, flying?: false) }
  let(:plane2) { double(:plane, flying?: false) }
  subject { Airport.new "Paris" }

  before(:each) { allow(subject).to receive(:weather_report).and_return("sunny") }

  it "should have a name" do
    expect(subject.name).to eq "Paris"
  end

  it "should have a default capacity" do
    expect(subject.capacity).to eq Airport::DEFAULT_CAPACITY
  end

  describe "#new" do
    it "should accept an optional argument for custom capacity of 30" do
      airport = Airport.new("Barcelona", 30)
      expect(airport.capacity).to eq 30
    end
  end

  describe "#count" do
    it "should be zero if no planes have landed" do
      expect(subject.count).to eq 0
    end

    it "should be 1 if the airport has accepted a plane" do
      subject.accept plane
      expect(subject.count).to eq 1
    end
    
    it "should be zero if the plane has taken off" do
      subject.accept plane
      allow(plane).to receive(:flying?).and_return(true)
      expect(subject.count).to eq 0
    end

    it "should be 2 if two planes have landed" do
      subject.accept plane
      subject.accept plane2
      expect(subject.count).to eq 2
    end

    it "should be 1 if two planes have landed and one takes off" do
      subject.accept plane
      subject.accept plane2
      allow(plane).to receive(:flying?).and_return(true)
      expect(subject.count).to eq 1
    end
  end

  describe "#accept" do
    it "should return true if the airport accepts the plane" do
      expect(subject.accept plane).to be true
    end

    it "should return false if the airport is full" do
      Airport::DEFAULT_CAPACITY.times { subject.accept(plane) }
      expect(subject.accept plane).to be false
    end

    it "planes shouldn't be added to the airport if it is full" do
      Airport::DEFAULT_CAPACITY.times { subject.accept(plane) }
      subject.accept plane
      expect(subject.count).to eq Airport::DEFAULT_CAPACITY
    end

    it "should accept a different number of planes if the capacity isn't default" do
      airport = Airport.new("Valencia", 25)
      allow(airport).to receive(:weather_report).and_return("sunny")
      25.times { expect(airport.accept plane).to eq true }
      expect(airport.accept plane).to eq false
    end

    it "shouldn't accept a plane if there's bad weather" do
      allow(subject).to receive(:weather_report).and_return("stormy")
      expect(subject.accept plane).to eq false
    end
  end

  describe "#weather_report" do
    it "should return either 'sunny' or 'stormy'" do
      airport = Airport.new "Sydney"
      expect(airport.weather_report).to eq("sunny").or eq("stormy")
    end

    it "shouldn't just return one type of weather all the time" do
      airport = Airport.new "LAX"
      weather = Array.new(50) { airport.weather_report }
      expect(weather.uniq.size).to eq 2
    end
  end
end
