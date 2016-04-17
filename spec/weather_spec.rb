 require 'weather.rb'

describe Weather do
  
  describe '#stormy?' do
    it "if random number for weather is > 6" do
      allow(subject).to receive(:rand) {7}
      expect(subject.stormy?).to eq true
    end
    it "if random number for weather is =< 6" do
      allow(subject).to receive(:rand) {6}
      expect(subject.stormy?).to eq false
    end
  end
end
