require "weather"

describe Weather do
  subject(:weather) {described_class.new}
  it {is_expected.to be_a(Object)}
  it "should have a 'is_stormy?' predicate method" do
    expect(weather).to respond_to(:is_stormy?)
  end
  describe "stormy" do
    module Boolean; end
    class TrueClass; include Boolean; end
    class FalseClass; include Boolean; end
    it "should return true or false" do
      expect(weather.is_stormy?).to be_a(Boolean)
    end
    it "should return true is weather is stormy" do
      allow(weather).to receive(:random).and_return(0)
      expect(weather.is_stormy?).to eq(true)
    end
    it "should return false is weather is sunny" do
      allow(weather).to receive(:random).and_return(1)
      expect(weather.is_stormy?).to eq(false)
    end
  end
  describe "random" do
    it "should be a method" do
      expect(weather).to respond_to(:random)
    end
    it "should return a random number from 0 to 3" do
      subject = [0,1,2,3]
      expect(subject).to include(weather.random)
    end
  end
  describe "values" do
    it "should be a method" do
      expect(weather).to respond_to(:values)
    end
    it "should contain an array" do
      expect(weather.values).to be_a(Array)
    end
    it "should have 4 elements" do
      expect(weather.values.count).to eq 4
    end
    it "the array should contain symbols describing the weather as :stormy or :sunny" do
      expect(weather.values).to include(:sunny,:stormy)
    end
  end
end
