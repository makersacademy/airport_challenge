require "weather"

describe Weather do
  let(:stormy_weather) {double :weather}
  let(:nice_weather) {double :weather}

  context "Setup" do
    it "tests for a weather class" do
      expect(subject.class).to eq(Weather)
    end
  end

  context "Set Weather" do
    it "expects weather to respond to stormy " do
      expect(subject).to respond_to(:stormy)
    end

    #look at these again
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
