require './lib/airport'

describe Airport do
  let(:plane) { double("plane") }

  it { is_expected.to respond_to(:receive).with(1).argument }
  it { is_expected.to respond_to(:release).with(1).argument }
  it { is_expected.to respond_to(:full?) }

  it "has a customisable capacity upon initialising instance" do
    airport = Airport.new(50)
    50.times { airport.receive(plane) }
    expect(airport.full?).to eq true
  end

  describe "#receive" do
    it "returns true when plane has been received" do
      expect(subject.receive(plane)).to eq true
    end
  end

  describe "#release" do
    it "returns true when plane has been released" do
      expect(subject.release(plane)).to eq true
    end
  end

  describe "#full?" do
    it "returns true when the airport is full" do
      #Default capacity is 30
      30.times { subject.receive(plane) }
      expect(subject.full?).to eq true
    end

    it "returns false when the airport is not full" do
      #Default capacity is 30
      29.times { subject.receive(plane) }
      expect(subject.full?).to eq false
    end
  end
  
end