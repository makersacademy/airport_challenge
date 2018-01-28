require 'weather'

describe Weather do
  describe "#random weather" do
    subject { Weather.new }
    it { is_expected.to respond_to :random_weather }
    it "should return stormy weather if random is 2" do
      allow(subject).to receive(:rand).and_return(2)
      expect(subject.random_weather).to eq "stormy"
  end
end
    it "should return clear weather if random is 1 and 3" do
      allow(subject).to receive(:rand).and_return(1,3)
      expect(subject.random_weather).to eq "clear"
  end
end
