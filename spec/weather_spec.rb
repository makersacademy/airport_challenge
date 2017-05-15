require 'weather'

describe Weather do
  describe '#stormy?' do
    it 'shows weather defaults to fair' do
      weather = described_class.new(0)
      expect(weather.stormy?).to eq false
    end
    it "shows the weather can be stormy" do
      weather = described_class.new(100)
      expect(weather.stormy?).to eq true
    end
  end
end
