require 'airport'

describe Airport do
  let(:plane) { double(:plane, flying?: false) }
  let(:plane2) { double(:plane, flying?: false) }
  subject { Airport.new "Paris" }

  it "should have a name" do
    expect(subject.name).to eq "Paris"
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
end
