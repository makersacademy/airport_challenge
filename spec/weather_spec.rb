require 'weather'

describe Weather do
  it "weather exists" do
    weather = Weather.new
    expect(weather).to be_an_instance_of(Weather)
  end

  describe "#stormy" do
    it { is_expected.to respond_to :stormy? }

    it "return true if forecast is stormy" do
      weather = Weather.new
      allow(weather).to receive(:forecast) { :stormy }
      expect(weather.stormy?).to be true
    end

    it "return false if forecast is sunny" do
      weather = Weather.new
      allow(weather).to receive(:forecast) { :sunny }
      expect(weather.stormy?).to be false
    end
  end

end
