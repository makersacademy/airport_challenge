require 'weather'

describe Weather do
  subject(:weather) {described_class.new}

 it { is_expected.to respond_to(:check_weather) }

  describe "#stormy?"
    it "can confirms whether the weather is stormy" do
      allow(subject).to receive(:check_weather).and_return 1
      expect(subject).to be_stormy
    end

    it "can confirms whether the weather is not stormy" do
      allow(subject).to receive(:check_weather).and_return 4
      expect(subject).not_to be_stormy
    end
end
