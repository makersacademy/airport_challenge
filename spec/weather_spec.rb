require "weather"

describe Weather do
  subject(:weather) { described_class.new }
  let(:stormy_weather) {double :weather}
  let(:nice_weather) {double :weather}

  context "Setup" do
    it "tests for a weather class" do
      expect(subject.class).to eq(Weather)
    end
  end

  context "Set Weather" do
    it "expects weather to respond to a method called set_weather_integer" do
      expect(subject).to respond_to(:set_weather_integer)
    end

    it "expects the weather to be set between 0 and 100" do
      expect(subject.set_weather_integer).to be_within(50).of(50)
    end

    it "expects weather to respond to a method called stormy?" do
      expect(subject).to respond_to(:stormy?)
    end

    #fix these two tests
    it "expects stormy? to be true if it is stormy" do
      allow(stormy_weather).to receive(:stormy?).and_return(true)
      expect(stormy_weather).to be_stormy
    end

    it "expects stormy? to be false if it is not stormy" do
      allow(nice_weather).to receive(:stormy?).and_return(false)
      expect(nice_weather).not_to be_stormy
    end

  end
end
