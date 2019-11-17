require 'airport'

describe Airport do
  let(:plane) { double(:plane, flying?: false) }
  let(:plane2) { double(:plane, flying?: false) }
  let(:weather) { double(:weather, stormy?: false) }

  def bad_weather
    allow(weather).to receive(:stormy?).and_return(true)
  end

  subject { Airport.new("Paris", weather: weather) }

  before(:each) { allow(subject).to receive(:weather_report).and_return("sunny") }

  it "should have a name" do
    expect(subject.name).to eq "Paris"
  end

  it "should have a default capacity" do
    expect(subject.capacity).to eq Airport::DEFAULT_CAPACITY
  end

  describe "#new" do
    it "should accept an optional argument for custom capacity of 30" do
      airport = Airport.new("Barcelona", capacity: 30)
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
      subject.take_off_slot plane
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
      subject.take_off_slot plane2
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
      airport = Airport.new("Valencia", capacity: 25, weather: weather)
      25.times { expect(airport.accept plane).to eq true }
      expect(airport.accept plane).to eq false
    end

    it "shouldn't accept a plane if there's bad weather" do
      bad_weather
      expect(subject.accept plane).to eq false
    end
  end

  describe "#take_off_slot" do
    it "should return true if it's sunny" do
      expect(subject.take_off_slot plane).to eq true
    end

    it "should return false if it's stormy" do
      bad_weather
      expect(subject.take_off_slot plane).to eq false
    end
  end
end
