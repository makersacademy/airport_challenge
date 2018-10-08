require 'weather.rb'

describe Weather do
  let(:weather) { Weather.new }
  describe '#stormy?' do
    it "checks the weather" do
      allow(Kernel).to receive(:rand).and_return(3)
      expect(weather.stormy?).to eq false
    end
    it "checks the weather" do
      allow(Kernel).to receive(:rand).and_return(5)
      expect(weather.stormy?).to eq true
    end
  end
end
