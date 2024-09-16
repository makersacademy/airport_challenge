require 'weather'

describe Weather do
  let (:weather) { Weather.new }
  describe '#stormy?' do
    it "returns sunny" do
      allow(Kernel).to receive(:rand).and_return 1
      expect(weather.stormy?).to be false
    end

    it "returns stormy" do
        allow(Kernel).to receive(:rand).and_return 6
        expect(weather.stormy?).to be true
    end
  end
end