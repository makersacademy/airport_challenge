require 'weather'


describe Weather do
  subject(:weather) {described_class.new}

  describe "#stormy?"
    it "can confirms whether the weather is stormy" do
      allow(subject).to receive(:check_weather).and_return 1
      expect(subject).to be_stormy
    end
end
