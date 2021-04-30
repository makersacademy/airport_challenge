require 'weather'

describe Weather do
  subject(:weather) { described_class.new }

  describe "#Stormy?" do
    it "Can be not stormy" do
      allow(Kernel).to receive(:rand).and_return 1
      expect(weather.stormy?).to be false
    end

    it "Can be stormy" do
      allow(Kernel).to receive(:rand).and_return 6
      expect(weather.stormy?).to be true
    end
  end

end
