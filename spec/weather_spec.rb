require "weather"

describe Weather do

  describe "#the_weather" do

    it "When equal to 1, stormy weather" do
      allow(subject).to receive(:rand) { 1 }
      expect(subject.the_weather).to eq :stormy
    end

    it "When equal to 2, sunny weather" do
      allow(subject).to receive(:rand) { 2 }
      expect(subject.the_weather).to eq :sunny
    end
  end
end

# done!!!
