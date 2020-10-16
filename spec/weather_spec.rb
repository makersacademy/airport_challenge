require_relative '../lib/weather.rb'

describe Weather do
  it { is_expected.to respond_to(:conditions) }
  it { is_expected.to respond_to(:stormy?) }

  describe "creating a new Weather" do
    it "creates a new weather object" do
      expect(Weather.new).to be_instance_of Weather
    end
  end
  describe ".conditions" do
    it "draws a stormy weather" do
      allow(subject).to receive(:rand).and_return(0)
      expect(subject.conditions).to eq "stormy"
    end
    it "draws a sunny weather" do
      allow(subject).to receive(:rand).and_return(2)
      expect(subject.conditions).to eq "sunny"
    end
  end
  describe ".stormy?" do
    it "returns true if stormy weather occurs" do
      allow(subject).to receive(:rand).and_return(0)
      expect(subject.stormy?).to eq true
    end
    it "returns false if sunny weather occurs" do
      allow(subject).to receive(:rand).and_return(1)
      expect(subject.stormy?).to eq false
    end
  end
end
