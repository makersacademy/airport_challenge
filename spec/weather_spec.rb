require 'weather'

describe Weather do
subject(:weather) {described_class.new }

  describe '#stormy' do
    it "can be non-stormy" do
      allow(Kernel).to receive(:rand).and_return 1
      expect(weather.stormy?).to eq false
    end

    it "can be stormy" do
      allow(Kernel).to receive(:rand).and_return 6
      expect(weather.stormy?).to eq true
    end
  end


end
