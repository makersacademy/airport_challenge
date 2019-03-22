require "airport"

describe Airport do
  describe "#full?" do
    it "give true when full" do
      subject.capacity = 0
      expect(subject.full?).to eq true
    end

    it "give false when not full" do
      subject.capacity = 5
      expect(subject.full?).to eq false
    end
  end

  describe "#initialize" do
    it "set the capacity in a new airport to DEFAULT_CAPACITY when none given" do
      expect(subject.capacity).to eq Airport::DEFAULT_CAPACITY
    end

    it "set the capacity properly when is given" do
      airport = Airport.new(5)
      expect(airport.capacity).to eq 5
    end
  end
end
