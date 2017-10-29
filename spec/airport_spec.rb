require 'airport'

describe Airport do

  let(:plane) { double(:plane) }

  describe "#planes" do
    it { is_expected.to respond_to(:planes) }
    it "should have a database of the planes at the airport" do
      expect(subject.planes).to eq([])
    end
  end

  describe "#weather_conditions" do
    it { is_expected.to respond_to(:weather_conditions) }
    it "should be sunny or stormy" do
      expect([:sunny, :stormy]).to include(subject.weather_conditions)
    end
  end

  describe "#capacity" do
    it { is_expected.to respond_to(:capacity) }
    it "should have a default max of 1 plane allowed in the airport" do
      expect(subject.capacity).to eq(1)
    end
    it "should override default capacity" do
      subject.capacity = 100
      expect(subject.capacity).to eq(100)
    end
  end

  describe "#full?" do
    it { is_expected.to respond_to(:full?) }
    it "should return true if the capacity is reached" do
      subject.planes << plane
      expect(subject.full?).to eq(true)
    end
  end
end
