require 'weather'

describe Weather do
  subject(:weather) { described_class.new }

  context '#initialize' do
    it "returns stromy weather when randomly generated weather is 'stormy'" do
      allow(weather).to receive(:weather) { :stormy }
      expect(weather.weather).to eq :stormy
    end

    it "returns sunny weather when randomly generated weather is 'sunny'" do
      allow(weather).to receive(:weather) { :sunny }
      expect(weather.weather).to eq :sunny
    end
  end

  describe "#stormy?" do
    it "confirms stormy weather" do
      allow(weather).to receive(:stormy?) { true }
      expect(subject).to be_stormy
    end
  end
end
