require "weather"

describe Weather do
  describe "#current_weather" do
    it "should return stormy weather when random value is 4" do
      allow(subject).to receive(:rand).and_return(4)
      expect(subject.current_weather).to eq :stormy
    end
    it "should return clear weather when random value is 1" do
      allow(subject).to receive(:rand).and_return(1)
      expect(subject.current_weather).to eq :clear
    end
  end

end
